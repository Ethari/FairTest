-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 25 Lis 2017, 13:13
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
(51, 'C++', 1);

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
  `ended` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `generated_test`
--

INSERT INTO `generated_test` (`id`, `scheduled_test_id`, `student_id`, `random_test`, `time_started`, `ended`) VALUES
(7, 14, 191, 'a:6:{i:0;a:4:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:3:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:3:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:3:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:3:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:1;a:4:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:3:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:1;a:3:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:2;a:3:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:3:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:4:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:7:\"answers\";a:5:{i:0;a:3:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:1;a:3:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:2;a:3:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:3;a:3:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:4;a:3:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:3:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";}i:4;a:3:{s:11:\"question_id\";s:2:\"43\";s:11:\"description\";s:25:\"<p>What is your name?</p>\";s:4:\"type\";s:13:\"open_question\";}i:5;a:4:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:3:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:1;a:3:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:3:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:3;a:3:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}}}}', 1510415825, 0),
(9, 15, 191, 'a:7:{i:0;a:4:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}}}i:1;a:3:{s:11:\"question_id\";s:2:\"40\";s:11:\"description\";s:60:\"<p>What is the difference between arrays and collection?</p>\";s:4:\"type\";s:13:\"open_question\";}i:2;a:4:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:4:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:4:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:3:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";}i:6;a:4:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}}}', 1510426555, 0),
(10, 17, 191, 'a:7:{i:0;a:3:{s:11:\"question_id\";s:2:\"40\";s:11:\"description\";s:60:\"<p>What is the difference between arrays and collection?</p>\";s:4:\"type\";s:13:\"open_question\";}i:1;a:4:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:4:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:4:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:3:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";}i:5;a:4:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}}}i:6;a:4:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}}}', 1510434539, 0),
(11, 18, 191, 'a:7:{i:0;a:4:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:3:{s:11:\"question_id\";s:2:\"40\";s:11:\"description\";s:60:\"<p>What is the difference between arrays and collection?</p>\";s:4:\"type\";s:13:\"open_question\";}i:2;a:4:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}}}i:3;a:4:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:3:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";}i:5;a:4:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}}}i:6;a:4:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}}}}', 1510441343, 0),
(12, 19, 191, 'a:7:{i:0;a:3:{s:11:\"question_id\";s:2:\"40\";s:11:\"description\";s:60:\"<p>What is the difference between arrays and collection?</p>\";s:4:\"type\";s:13:\"open_question\";}i:1;a:4:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:3:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";}i:3;a:4:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}}}i:4;a:4:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:4:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}i:6;a:4:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}}}}', 1510593186, 0),
(15, 20, 191, 'a:7:{i:0;a:6:{s:11:\"question_id\";s:2:\"40\";s:11:\"description\";s:60:\"<p>What is the difference between arrays and collection?</p>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"0\";}i:1;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:40:\"<p>Some description of the question.</p>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:17:\"Some false answer\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"48\";s:11:\"description\";s:16:\"Some true answer\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";}i:4;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}}}i:6;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}}}', 1510659703, 0),
(16, 21, 191, 'a:3:{i:0;a:7:{s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:28:\"<p>Czy clarin jest fajn?</p>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"37\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"test\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"38\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"ŻAK\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"33\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Tak\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"34\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Nie\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"36\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:5:\"??D?O\";s:6:\"answer\";s:4:\"true\";}i:5;a:4:{s:2:\"id\";s:2:\"35\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"Mo?e\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}}', 1510663472, 0),
(17, 22, 191, 'a:5:{i:0;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:28:\"<p>Czy clarin jest fajn?</p>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"33\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Tak\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"37\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"test\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"35\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"Mo?e\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"34\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Nie\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"38\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"ŻAK\";s:6:\"answer\";s:4:\"true\";}i:5;a:4:{s:2:\"id\";s:2:\"36\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:5:\"??D?O\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:4;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}}}}', 1510667303, 0),
(18, 23, 191, 'a:5:{i:0;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:1;a:7:{s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:28:\"<p>Czy clarin jest fajn?</p>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:6:{i:0;a:4:{s:2:\"id\";s:2:\"35\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"Mo?e\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"33\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Tak\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"38\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"ŻAK\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"36\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:5:\"??D?O\";s:6:\"answer\";s:4:\"true\";}i:4;a:4:{s:2:\"id\";s:2:\"34\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:3:\"Nie\";s:6:\"answer\";s:4:\"true\";}i:5;a:4:{s:2:\"id\";s:2:\"37\";s:11:\"question_id\";s:2:\"56\";s:11:\"description\";s:4:\"test\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}}', 1510918809, 0);
INSERT INTO `generated_test` (`id`, `scheduled_test_id`, `student_id`, `random_test`, `time_started`, `ended`) VALUES
(20, 24, 191, 'a:6:{i:0;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}}}i:3;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}}', 1511197893, 0),
(21, 25, 191, 'a:6:{i:0;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}}}i:3;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:4;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}}}', 1511201020, 0),
(23, 26, 191, 'a:6:{i:0;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:3;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}}}}', 1511347739, 1);

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
(19, 'JavaHava', 'Monday', '11 : 30 AM', 1, 48),
(20, 'francesco', 'Monday', '12 : 17 PM', 1, 51),
(21, 'Internet Technologies', 'Monday', '11 : 55 AM', 1, 51),
(22, 'Diploma Seminar', 'Monday', '11 : 55 AM', 1, 51),
(23, 'Networks', 'Monday', '11 : 55 AM', 1, 49),
(24, '1', 'Monday', '11 : 56 AM', 1, 51),
(25, '2', 'Monday', '11 : 56 AM', 1, 51),
(26, '3', 'Monday', '11 : 56 AM', 1, 51),
(27, '4', 'Monday', '11 : 56 AM', 1, 51),
(28, '5', 'Monday', '11 : 57 AM', 1, 51),
(29, '6', 'Monday', '11 : 57 AM', 1, 51);

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
(176, 16),
(177, 16),
(181, 16),
(186, 16),
(188, 16),
(189, 16),
(191, 22);

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
(1, 32, 'Code is correct', 'true'),
(2, 32, 'Code is not correct', 'false'),
(3, 33, 'Echo of number', 'true'),
(4, 33, 'Somethn', 'false'),
(5, 33, 'asdasd', 'false'),
(6, 34, 'integer', 'true'),
(7, 34, 'string', 'true'),
(8, 34, 'class', 'true'),
(9, 34, 'boolean', 'true'),
(10, 35, 'asdasd', 'false'),
(11, 36, 'asd', 'false'),
(12, 37, 'the spreading of the infection to the sinuses.', 'true'),
(13, 37, 'damage to the olfactory nerve.', 'false'),
(14, 37, 'destruction of white blood cells.', 'false'),
(15, 37, 'congestion of the mucous membrane in the nose', 'false'),
(16, 38, 'hinder … incentive', 'false'),
(17, 38, 'thwart … refuge', 'false'),
(18, 38, 'impede … deterrent', 'true'),
(19, 38, 'permit … provocation', 'false'),
(20, 39, 'meticulous', 'true'),
(21, 39, 'lackadaisical', 'false'),
(22, 39, 'apathetic', 'false'),
(23, 39, 'relaxed', 'false'),
(24, 39, 'lethargic', 'false'),
(25, 42, '1', 'false'),
(26, 42, '2', 'true'),
(27, 42, '3', 'false'),
(28, 42, '4', 'false'),
(29, 49, 'This code looks good', 'true'),
(30, 49, 'B', 'false'),
(31, 49, 'C', 'false'),
(32, 49, 'D', 'false'),
(33, 51, 'sda', 'true'),
(34, 51, 'asd', 'true'),
(35, 51, 'asdasd', 'false'),
(36, 52, '1', 'true'),
(37, 52, '2', 'false'),
(38, 52, '3', 'true'),
(39, 52, '4', 'false'),
(40, 53, 'anser', 'false'),
(41, 53, 'answer1', 'true'),
(42, 53, 'anaser2', 'false'),
(43, 53, 'nsdkoasd', 'true');

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
(49, 2, '<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>', 'programming, something', '2017-06-21 13:07:14'),
(50, 1, '', '', '2017-10-03 12:23:02'),
(51, 2, '<p>test question</p>', '', '2017-10-03 12:30:37'),
(52, 2, '<p>Some question</p>', '', '2017-10-07 17:12:41'),
(53, 2, '<p>asdasdasd</p>', 'Ibrahim', '2017-10-10 09:32:45'),
(54, 3, '<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>', '', '2017-10-10 18:35:43'),
(55, 1, '<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>', '', '2017-10-11 08:21:50'),
(56, 1, '<p>Czy clarin jest fajn?</p>', '', '2017-10-18 16:18:39'),
(57, 3, '<p>rwsar</p>', 'test', '2017-11-06 18:04:41'),
(58, 1, '<p>function test(){</p>\n<pre class=\"language-php\"><code>function test(){\n}</code></pre>\n<p>}</p>', 'test', '2017-11-08 11:07:22');

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
  `firstName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 NOT NULL,
  `studentIndex` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `student`
--

INSERT INTO `student` (`id`, `firstName`, `lastName`, `studentIndex`, `password`) VALUES
(176, '\0P\0a\0u\0l\0i\0n\0a\0 ', '\0B\0i\0n\0a\0s', '220641', 'd4.uXoif7DOKc'),
(177, '\0P\0a\0t\0r\0y\0k\0 ', '\0B\0r\0e\0s\0s\0o', '220643', 'd47fYVSRVxlbM'),
(178, '\0T\0e\0n\0z\0i\0n\0 ', '\0C\0h\0o\0e\0w\0a\0n\0g', '218890', 'd4n8AzxCujKbA'),
(179, '\0S\0z\0y\0m\0o\0n\0 \0A\0n\0d\0r\0z\0e\0j', '\0H\0a\0j\0d\0u\0k', '220621', 'd4oljvunxP5k2'),
(180, '\0M\0a\0t\0e\0u\0s\0z\0 ', '\0K\0a\0w\0u\0l\0a', '212894', 'd4OaiqESg7vUY'),
(181, '\0A\0l\0e\0k\0s\0a\0n\0d\0r\0a\0 \0D\0o\0m\0i\0n\0i\0k\0a', '\0M\0i\0c\0h\0a\0l\0e\0w\0s\0k\0a', '220649', 'd4Wax17I5kkGY'),
(183, '\0T\0s\0v\0e\0t\0a\0n\0 \0T\0s\0v\0e\0t\0a\0n\0o\0v', '\0O\0v\0e\0d\0e\0n\0s\0k\0i', '223288', 'd483ZjB7tAnGU'),
(184, '\0R\0u\0p\0a\0l\0i\0 ', '\0S\0h\0a\0r\0m\0a', '223212', 'd40u8izkRplX.'),
(186, '\0D\0i\0l\0z\0i\0y\0o\0d\0b\0e\0k\0 ', '\0U\0s\0m\0o\0n\0o\0v', '222078', 'd4uAdsgl6bkT2'),
(187, '\0M\0a\0t\0e\0u\0s\0z\0 \0W\0o\0j\0c\0i\0e\0c\0h', '\0W\0o\0d\0a', '220636', 'd4aVhEF0SErQ.'),
(188, '\0I\0v\0a\0n\0 ', '\0Y\0u\0s\0h\0c\0h\0u\0k', '219681', 'd40ZZkb/zYHlc'),
(189, '\0M\0i\0k\0oB\0a\0j', '\0S\0z\0e\0w\0c\0z\0y\0k', '223965', 'd49hNgtS5xwtg'),
(190, 'Marek', 'Żądło', '229182', 'd4pzm54rBePmE'),
(191, 'Jan', 'Kowalski', '201922', 'd41J5VaB1BFS6');

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
(11, 'new_test_11', 'new_topic_11', 1),
(12, 'new_test_12', 'new_topic_12', 1),
(13, 'new_test_13', 'new_topic_13', 1),
(14, 'new_test_14', 'new_topic_14', 1),
(15, 'new_test_15', 'new_topic_15', 1),
(16, 'new_test_16', 'new_topic_16', 1);

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
(12, 49, 1, 0, 0),
(12, 39, 1, 0, 0),
(11, 49, 4, 0, 1),
(11, 55, 1, 0, 1),
(15, 58, 1, 0, 0),
(15, 49, 1, 0, 0),
(11, 37, 2, -1, 1),
(11, 54, 3, -2, 0),
(16, 49, 1, 0, 0),
(11, 39, 1, 0, 1),
(11, 38, 1, 0, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `test_results`
--

CREATE TABLE `test_results` (
  `generated_test_id` int(11) NOT NULL,
  `result` longtext NOT NULL,
  `fully_evaluated` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `test_results`
--

INSERT INTO `test_results` (`generated_test_id`, `result`, `fully_evaluated`) VALUES
(23, 'a:8:{i:0;a:12:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:5:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:2;s:15:\"negative_points\";d:-0;s:12:\"total_points\";d:2;}i:1;a:12:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:5:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}i:2;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}s:17:\"manual_evaluation\";b:1;i:3;a:12:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:5:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:5:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:5:\"false\";}i:2;a:5:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:3;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:3;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:3;}i:4;a:12:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:5:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:4;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:4;}i:5;a:12:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:3;a:5:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}s:12:\"total_points\";d:11;}', 0);

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
(2, 11, '2017-11-15 17:19:00', '2017-11-06 17:19:00', 'end_of_exam', 120, NULL),
(3, 11, '2017-11-08 17:28:00', '2017-11-08 18:28:00', 'end_of_exam', 120, NULL),
(4, 11, '2017-11-10 18:11:00', '2017-11-10 19:11:00', 'specify_time', 120, '2017-11-08 20:20:00'),
(5, 11, '2017-11-08 10:25:00', '2017-11-08 18:00:00', 'end_of_exam', 120, NULL),
(6, 10, '2017-11-13 11:00:00', '2017-11-13 12:00:00', 'specify_time', 60, '2017-11-22 12:00:00'),
(7, 11, '2017-11-07 11:00:00', '2017-11-07 12:00:00', 'manual', 120, NULL),
(8, 11, '2017-11-07 09:15:00', '2017-11-07 10:20:00', 'specify_time', 80, '2017-11-17 11:20:00'),
(9, 10, '2017-11-07 23:08:00', '2017-11-07 23:59:00', 'end_of_exam', 120, NULL),
(10, 10, '2017-11-08 09:46:00', '2017-11-08 13:46:00', 'end_of_exam', 120, NULL),
(11, 11, '2017-11-08 11:08:00', '2017-11-08 13:08:00', 'specify_time', 120, '2017-11-09 12:08:00'),
(12, 12, '2017-11-10 11:09:00', '2017-11-10 11:09:00', 'end_of_exam', 22, NULL),
(13, 11, '2017-11-09 21:24:00', '2017-11-09 23:24:00', 'end_of_exam', 80, NULL),
(14, 10, '2017-11-11 12:06:00', '2017-11-11 21:06:00', 'end_of_exam', 120, NULL),
(15, 10, '2017-11-11 19:31:00', '2017-11-11 23:31:00', 'end_of_exam', 120, NULL),
(16, 10, '2017-11-11 22:07:00', '2017-11-11 00:07:00', 'end_of_exam', 333, NULL),
(17, 10, '2017-11-11 22:08:00', '2017-11-11 23:59:00', 'end_of_exam', 300, NULL),
(18, 10, '2017-11-12 00:02:00', '2017-11-12 23:02:00', 'end_of_exam', 500, NULL),
(19, 10, '2017-11-13 18:10:00', '2017-11-13 23:56:00', 'end_of_exam', 90, NULL),
(20, 10, '2017-11-14 09:30:00', '2017-11-14 15:30:00', 'end_of_exam', 300, NULL),
(21, 11, '2017-11-14 13:44:00', '2017-11-14 14:44:00', 'end_of_exam', 1, NULL),
(22, 11, '2017-11-14 14:48:00', '2017-11-14 17:48:00', 'end_of_exam', 20, NULL),
(23, 11, '2017-11-17 12:39:00', '2017-11-17 17:39:00', 'end_of_exam', 30, NULL),
(24, 11, '2017-11-20 18:08:00', '2017-11-20 20:08:00', 'end_of_exam', 80, NULL),
(25, 11, '2017-11-20 19:03:00', '2017-11-20 23:03:00', 'end_of_exam', 120, NULL),
(26, 11, '2017-11-22 10:54:00', '2017-11-22 14:54:00', 'end_of_exam', 40, NULL);

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
(3, 24),
(3, 25),
(4, 24),
(4, 25),
(4, 26),
(4, 27),
(4, 28),
(4, 29),
(5, 16),
(6, 16),
(7, 16),
(8, 16),
(9, 16),
(10, 16),
(11, 22),
(12, 22),
(13, 22),
(14, 22),
(15, 22),
(16, 22),
(17, 16),
(17, 22),
(18, 16),
(18, 22),
(19, 22),
(20, 22),
(21, 22),
(22, 22),
(23, 22),
(24, 22),
(25, 22),
(26, 22);

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
(9, 191, 39, 21, 'true'),
(9, 191, 39, 22, 'true'),
(9, 191, 39, 23, 'true'),
(9, 191, 39, 24, 'true'),
(9, 191, 48, 24, 'true'),
(9, 191, 48, 25, 'true'),
(9, 191, 48, 26, 'false'),
(9, 191, 48, 27, 'false'),
(9, 191, 48, 28, 'true'),
(10, 191, 38, 16, 'false'),
(10, 191, 38, 18, 'true'),
(10, 191, 38, 19, 'true'),
(10, 191, 39, 21, 'true'),
(10, 191, 39, 23, 'true'),
(10, 191, 39, 24, 'true'),
(10, 191, 40, 0, 'Może jednak lepiej coś mądrzejszego i poprawnego ;)'),
(10, 191, 48, 24, 'true'),
(10, 191, 48, 25, 'true'),
(10, 191, 48, 26, 'true'),
(10, 191, 48, 27, 'true'),
(10, 191, 48, 28, 'true'),
(10, 191, 49, 29, 'true'),
(10, 191, 49, 30, 'true'),
(10, 191, 54, 0, 'A tutaj cos innego.'),
(11, 191, 40, 0, 'omething'),
(11, 191, 49, 31, 'true'),
(11, 191, 49, 32, 'true'),
(12, 191, 39, 20, 'true'),
(12, 191, 48, 24, 'true'),
(12, 191, 48, 25, 'true'),
(12, 191, 48, 26, 'false'),
(12, 191, 48, 27, 'true'),
(12, 191, 48, 28, 'true'),
(15, 191, 40, 0, 'Cos tam'),
(15, 191, 49, 31, 'true'),
(15, 191, 49, 32, 'true'),
(16, 191, 49, 31, 'true'),
(16, 191, 49, 32, 'true'),
(16, 191, 55, 30, 'true'),
(16, 191, 55, 31, 'true'),
(16, 191, 55, 32, 'false'),
(16, 191, 56, 33, 'true'),
(16, 191, 56, 34, 'true'),
(16, 191, 56, 35, 'false'),
(16, 191, 56, 36, 'true'),
(16, 191, 56, 37, 'true'),
(16, 191, 56, 38, 'false'),
(17, 191, 37, 13, 'true'),
(17, 191, 37, 14, 'true'),
(17, 191, 49, 30, 'true'),
(17, 191, 49, 31, 'true'),
(17, 191, 54, 0, 'sdasdasd'),
(17, 191, 56, 33, 'false'),
(18, 191, 55, 31, 'true'),
(20, 191, 37, 12, 'true'),
(20, 191, 37, 14, 'true'),
(20, 191, 38, 16, 'true'),
(20, 191, 38, 19, 'true'),
(21, 191, 37, 12, 'true'),
(21, 191, 37, 13, 'true'),
(21, 191, 38, 16, 'true'),
(21, 191, 38, 18, 'true'),
(21, 191, 39, 20, 'true'),
(21, 191, 39, 21, 'true'),
(21, 191, 39, 23, 'true'),
(21, 191, 49, 31, 'true'),
(21, 191, 49, 32, 'true'),
(21, 191, 54, 0, 'Test12312312312'),
(21, 191, 55, 30, 'false'),
(21, 191, 55, 31, 'false'),
(21, 191, 55, 32, 'true'),
(22, 191, 37, 13, 'true'),
(22, 191, 37, 14, 'true'),
(22, 191, 38, 16, 'true'),
(22, 191, 38, 17, 'true'),
(22, 191, 39, 20, 'true'),
(22, 191, 39, 21, 'true'),
(22, 191, 39, 22, 'true'),
(22, 191, 49, 30, 'true'),
(22, 191, 49, 32, 'true'),
(22, 191, 54, 0, 'Some answer'),
(22, 191, 55, 30, 'true'),
(22, 191, 55, 31, 'false'),
(22, 191, 55, 32, 'true'),
(23, 191, 37, 12, 'true'),
(23, 191, 38, 18, 'true'),
(23, 191, 39, 20, 'true'),
(23, 191, 49, 29, 'true'),
(23, 191, 54, 0, 'DUnno'),
(23, 191, 55, 30, 'true'),
(23, 191, 55, 31, 'false'),
(23, 191, 55, 32, 'true');

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
(1, 28, '\"Hello\" is a string.', '0'),
(2, 28, 'Strings can be concatenated with numbers in PHP.', '0'),
(3, 28, '+ is used to concatenate strings.', '0'),
(4, 28, 'Test', '0'),
(5, 29, 'asdasd', '0'),
(6, 29, 'asd', '0'),
(7, 29, 'asd', '0'),
(8, 29, 'asd', '0'),
(9, 29, 'asd', '0'),
(10, 30, 'To be or not to be', 'true'),
(11, 30, 'q1', 'true'),
(12, 30, 'asd', 'true'),
(13, 30, 'asd', 'false'),
(14, 30, 'asd', 'true'),
(15, 31, 'Code is correct', ''),
(16, 31, 'Code is not correct', ''),
(17, 44, 'test', 'true'),
(18, 44, 'tesadas', 'false'),
(19, 46, 'This code is nice', 'true'),
(20, 46, 'Question is useful', 'false'),
(21, 46, 'This is false', 'false'),
(22, 46, 'Some true question', 'true'),
(23, 46, 'And another one', 'true'),
(24, 48, 'Some true answer', 'true'),
(25, 48, 'Some false answer', 'false'),
(26, 48, 'Some true answer', 'true'),
(27, 48, 'Some false answer', 'false'),
(28, 48, 'Some true answer', 'true'),
(29, 50, '', 'true'),
(30, 55, '1', 'true'),
(31, 55, '23', 'false'),
(32, 55, '4', 'true'),
(33, 56, 'Tak', 'true'),
(34, 56, 'Nie', 'true'),
(35, 56, 'Mo?e', 'false'),
(36, 56, '??D?O', 'true'),
(37, 56, 'test', 'true'),
(38, 56, 'ŻAK', 'true'),
(39, 58, '1', 'true'),
(40, 58, '2', 'false');

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
-- Indexes for table `generated_test`
--
ALTER TABLE `generated_test`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `multiple_choice_question`
--
ALTER TABLE `multiple_choice_question`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `test_schedule`
--
ALTER TABLE `test_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_student_answers`
--
ALTER TABLE `test_student_answers`
  ADD UNIQUE KEY `unique_index` (`scheduled_test_id`,`student_id`,`question_id`,`subquestion_id`);

--
-- Indexes for table `true_false_question`
--
ALTER TABLE `true_false_question`
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
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT dla tabeli `generated_test`
--
ALTER TABLE `generated_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT dla tabeli `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT dla tabeli `multiple_choice_question`
--
ALTER TABLE `multiple_choice_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT dla tabeli `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT dla tabeli `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;
--
-- AUTO_INCREMENT dla tabeli `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT dla tabeli `test_schedule`
--
ALTER TABLE `test_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT dla tabeli `true_false_question`
--
ALTER TABLE `true_false_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

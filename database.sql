-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 26 Lis 2017, 14:30
-- Wersja serwera: 10.1.21-MariaDB
-- Wersja PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `boardgamestore`
--
CREATE DATABASE IF NOT EXISTS `boardgamestore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `boardgamestore`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `category`
--

CREATE TABLE `category` (
  `ID` int(11) NOT NULL,
  `Name` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `category`
--

INSERT INTO `category` (`ID`, `Name`, `Info`) VALUES
(1, 'Action', 'Action games often compete players\' physical reflexes and co-ordination as a determinant of overall success.'),
(2, 'Adventure', 'Adventure games often have themes of heroism, exploration, and puzzle-solving. The storyline behind such games often have fantastical elements, and involve the characters in some sort of quest.'),
(3, 'Dice', 'Dice games often use dice as its sole or principal component. Dice games traditionally focus almost exclusively on dice rolling as a mechanic.'),
(4, 'Economic', 'Economic games encourage players to develop and manage a system of production, distribution, trade, and/or consumption of goods. The games usually simulate a market in some way. The term is often used interchangeably with resource management games.'),
(5, 'Educational', 'Educational games have been specifically designed to teach people about a certain subject, expand concepts, reinforce development, understand an historical event or culture, or assist them in learning a skill as they play.'),
(6, 'Electronic', 'Electronic games often have an electronic apparatus as the central component of the game. They differ from electrified games (e.g., Operation) as Electronic game components will contain circuitry, and sometimes a simple computer.'),
(7, 'Expansion', 'Expansion for Base-game games are sets of additional components and rules for expanding on an original base game. An expansion cannot be played alone; they must be used in conjunction with the base game.'),
(8, 'Card', 'Card Games often use cards as its sole or central component. There are stand-alone card games, in which all the cards necessary for gameplay are purchased at once. There are also Collectible Card Games (CCGs), where players purchase starter and \"booster\" packs in an effort to compile a more and more powerful deck of cards to compete with.'),
(9, 'Party Games', 'Party games are games that encourage social interaction. They generally have easy setups and simple rules, and they can accommodate large groups of people and play in a short amount of time.'),
(10, 'Puzzle', 'Puzzle games are those in which the players are trying to solve a puzzle. Many Puzzle games require players to use problem solving, pattern recognition, organization and/or sequencing to reach their objectives.'),
(11, 'Trivia', 'Trivia games often test players on their knowledge of general interests and popular culture.'),
(12, 'Strategy', 'Strategy games are often (but not always):\r\n\r\n    theme-less (without storyline)\r\n    built on simple and/or straightforward design and mechanics\r\n    perfect information games\r\n    games that promote one player overtaking their opponent(s)\r\n    little to no elements of luck, chance, or random occurrence\r\n');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` text COLLATE utf8_bin NOT NULL,
  `Description` text COLLATE utf8_bin NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Players` text COLLATE utf8_bin NOT NULL,
  `Time` int(11) NOT NULL,
  `Complexity` int(11) NOT NULL COMMENT 'minimal age of players',
  `Author` text COLLATE utf8_bin NOT NULL,
  `Publisher` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Board games';

--
-- Zrzut danych tabeli `product`
--

INSERT INTO `product` (`ID`, `Name`, `Description`, `Category_ID`, `Price`, `Players`, `Time`, `Complexity`, `Author`, `Publisher`) VALUES
(1, '3 Secrets', '\r\n\r\nIn the cooperative game 3 Secrets, players want to unravel the three secrets of an unresolved case before time runs out. One of the players plays the role of informant and knows the truth about the case: They know which secrets need to be discovered and try their best to help you guess them correctly. The clock is ticking and the clues are scarce, so question the informant to gather useful information and find the solution. If you grope in the dark, the informant can reveal an important clue, but this will cost you precious time! Use your best observing eye, lateral thinking, and deduction skills to unravel all the mysteries of the ambiguous characters that populate this game.\r\n\r\n3 Secrets comes with a free app available for download at the Apple AppStore and Google Play.\r\n', 2, '10', '2-8', 15, 14, 'Shiacchiera, Martino + Zizzi, \r\nPierre Luca', 'ABACUSSPIELE'),
(2, 'Sector 6', 'Sector 6 is an abstract strategy game for 1 to 4 players, with a playing time of 30 minutes. Each player controls two prisoners as they make their way through the winding labyrinth of a space prison, trying to collect enough oxygen to survive while denying their opponents the same. The goal is to collect as many points as possible (represented by oxygen tiles of different colors and values), located inside a maze formed by hexagonal tiles. Players must move across the maze and collect the points before their opponents.', 1, '28', '1-4', 60, 8, 'González Garcia, Jaime', 'ABBA GAMES'),
(3, 'Calimala', 'Players of Calimala are cloth merchants in medieval Florence, with a number of trusted employees that they assign to various streets within the city to carry out actions. (Each street connects two places where particular actions can be taken.) While taking these actions, players produce and deliver cloth and contribute to the construction and decoration of various buildings across the city. Employees stay on their assigned places for a while, carrying out their actions whenever the street is activated, and eventually are promoted into the city council, triggering a scoring phase.', 4, '40', '3-5', 75, 10, 'Lopiano, Fabio', 'ADC Blackfire'),
(4, 'Cat Lady', 'In Cat Lady, players are cat ladies, part of an elite group of people including Marie Antoinette and Ernest Hemingway. During the game, you and your fellow cat ladies will draft cards three at a time, collecting toys, food, catnip, costumes, and of course lovable cats. But watch out! Make sure you have enough food for all of your feline friends or your hungry cats will subtract points from your score. The player with the highest total victory points wins the game!', 8, '20', '2-4', 30, 14, 'Wood, Josh', 'Alderac'),
(5, 'In the Year of the Dragon', 'In In the Year of the Dragon, players take on the role of Chinese rulers around the year 1000. The game plays out in twelve rounds, with each round representing one month in a year that seems to go from bad to worse. Disease, drought, and attacks from the Mongols may claim lives, but make sure you have enough money to offer a tribute to the Emperor.', 4, '40', '2-5', 100, 12, 'Feld, Stefan', 'Ravensburger'),
(6, 'Critters Below', 'A great war has broken out and is threatening to eradicate all of Critterkind. A few of you have made it to a shelter deep underground. However the lights have gone out, leaving you in the dark with limited resources. You do not know how long you have to stay down here before it is safe to go outside. How many of you will survive and will you be among them? Will you work together?', 9, '25', '1-6', 60, 14, 'Kruppa, Gergely', 'Antler Games Kft'),
(7, 'Sword & Sorcery - Onamor Hero Pack', 'The world of Sword & Sorcery always needs new heroes! With this Hero Pack, you now have the possibility to introduce a new, powerful character into your campaign.\r\n\r\nSometimes, heroes are shadowy figures dabbling in the dark arts or renegades from their kin... Born into a family of powerful wizards, descendants of Avalon, Onamor can be played as either a Chaotic Necromancer or a Lawful Summoner.', 7, '15', '1-5', 180, 13, 'Nunzio, Romano + Nunzio, \r\nSimone + Nunzio, Surace', 'Ares Games Srl'),
(8, 'Kitchen Rush', 'ou\'ve just inherited an old restaurant and you must turn it into a successful business! Hire personnel, order the right ingredients and be ready to serve the customers that enter your restaurant. The success will depend entirely on your efficiency in the kitchen!\r\n\r\nKitchen Rush is an innovative real-time cooperative game that simulates the excitement of a high-pressure kitchen environment. It does so through worker placement, using hourglasses as your workers. These hourglasses are used to take orders from customers, prepare their dishes, serve them on time, buy groceries, clean plates and make sure enough money is made each round to cover wages, expenses, upgrades and hopefully, leave a profit. Any worker placed on an action space may not be used elsewhere before the sand within the hourglass runs out, making each decision important as time is limited.', 9, '48', '1-4', 45, 12, 'Turczi, David', 'Artipia Games'),
(9, 'Caverna - Cave vs cave', 'In the two-player game Caverna: Cave vs. Cave, each player starts the game with only two dwarves and a small excavation in the side of a mountain. Over the course of eight rounds, they\'ll double their workforce, open up new living space in the mountain, construct new buildings and rooms in which to live, and dig for precious metals.', 4, '20', '1-2', 40, 10, 'Rosenberg, Uwe', 'ASS'),
(10, 'Dance of the Fireflies', 'Dance of the Fireflies\' is a 2-6 player card game in which players striving to be the next royal gardener bid on flowers around a sundial in an attempt to create the most beautiful gardens and win the coveted title.', 8, '23', '2-6', 45, 8, 'Brooks, Oliver', 'Backspindle Games'),
(11, 'The Palace of Mad King Ludwig', 'King Ludwig II of Bavaria has called all great architects to design his greatest achievement: a world-renowned palace. Only the best will do! Gorgeous appointments, white stone, surrounded by water, with swans everywhere. Oh, and the Ludwig touch? All the architects must design the palace together. The designer who shows the strongest influence will receive the order to build it.\r\n\r\nIn The Palace of Mad King Ludwig, each player builds rooms one at a time in a single gigantic palace. As rooms are completed, a moat slowly forms around the outside. Once the ends of the moat connect, the palace is finished, and the player who has contributed the most to the palace wins!', 4, '50', '2-4', 75, 13, 'Alspach, Ted', 'Bezier Games, Inc.'),
(12, 'Booo!', '\r\n\r\nYou are attending the great ghost apprentice competition in \"Blackrock Castle\" in northern Scotland. In this tournament, you have to scare as many visitors as possible in order to win the disputed \"Ghost Master\" title. Who is going to be the fastest ghost?\r\n\r\nIn Booo!, you want to take the corridors and the secret passages, pass through the walls, and change colors to find the right path and scare Blackrock Castle\'s visitors before anyone else.\r\n', 10, '22', '2-6', 30, 7, 'Gonthier, Christophe', 'Blackrock Games'),
(13, 'Photosynthesis', 'The sun shines brightly on the canopy of the forest, and the trees use this wonderful energy to grow and develop their beautiful foliage. Sow your crops wisely and the shadows of your growing trees could slow your opponents down, but don\'t forget that the sun revolves around the forest. Welcome to the world of Photosynthesis, the green strategy board game!', 5, '40', '2-4', 60, 10, 'Hach, Hjalmar', 'Blue Orange'),
(14, 'Superhot the Card Game', 'A bullet misses you by millimeters. A dozen more come from every direction. Armed red guys are everywhere. You take a breath, check your options...and play a card.\r\n\r\nPart strategy, part shooter, and undeniably stylish, SUPERHOT is the bestselling independent FPS in which time moves only when you move. After its Steam and Xbox One releases, SUPERHOT is taking its unique game mechanisms to the world of tabletop games.', 8, '20', '1-3', 40, 12, 'Correia, Manuel', 'Board and Dice'),
(15, 'SPOILERS: The Beginning', 'Spoilers: The Beginning is a party-trivia game with movie questions and bluffing mechanisms. The player taking the spoiler role (a different one each turn) makes a question about what happens in a particular movie and gives three possible answers (A, B, C). The Spoiler knows the right answer and earns points when the other players answer incorrectly. Thus, the Spoiler tries to mislead them (and everyone knows that). Everyone takes the role of Spoiler three times, then the player with the most points wins.\r\n\r\nSpoilers: The Beginning is a standalone game with new playing rules that can also be combined with Spoilers: The Game, whether played with the original or new rules.', 11, '10', '3-6', 40, 12, 'Palau, Manu', 'Brain Picnic SL\r\nund Zacatrus'),
(16, 'Stack-A-Biddi', 'Time to stack your pieces high in Stack-A-Biddi, but you need to keep your pieces connected along the way.\r\n\r\nIn the game, each player has a set of eight long rectangular blocks, and on each of the four long faces of these blocks are thick black lines that travel from one edge to the other. Each player also has a set of four short blocks called \"biddis\", with each biddi being one of four colors.', 1, '15', '2-4', 30, 8, 'Rejchtman, Grzegorz', 'Carletto'),
(17, 'Khan of Khans', 'Fast-paced family game by Reiner Knizia, set in Greg Stafford\'s world of Glorantha. Players are khans of different fantastical tribes on the Plains of Prax, each riding a unique animal that confers special abilities. Everyone attempts to amass the biggest herd, meanwhile fighting off enemy magic, stampedes and attempts by other players to steal their cows.\r\n\r\nEach player chooses a Khan to play, and receives a set number of corral tiles (depending on the number of players in the game). Each Khan has a different special ability. For example, the Morokanth player gets one extra Corral tile, and the High Llama player can sneak one cow card into each of their corrals after the gate has been closed.', 8, '20', '2-5', 25, 9, 'Knizia, Dr. Reiner', 'Chaosium, Inc.'),
(18, 'Catham City', 'Catham Сity is steeped in intrigue and deceit — corrupted officials, bribed cops, lying journalists… One must have the thick fur and sharp claws to survive here, in this dump, and even prosper. In every turn you will have a choice: you can take more cards to gain the support of one of the groups or you can turn collected resources against your rival.', 8, '20', '2-6', 60, 12, 'Zhuravljov, Yuri', 'Cosmodrome'),
(19, 'Smiley Games', 'Smiley Games uses six different smiley cards (happy, angry, wink, sad, surprised, in love) in six different colors (orange, blue, yellow, green, violet, red) — along with special dice — for five different games that stimulate memory, reflexes and visual perception, while also requiring strategy, observation and concentration.', 9, '13', '2-10', 30, 5, 'Pessi, Emanuele', 'CreativaMente'),
(20, 'Adrenaline Team', 'Adrenaline: Team Game Expansion includes new elements for the Adrenaline base game, including a new player character, team play modes, new weapons, and a new poison damage mechanism, but it\'s still being developed at this time, so the final version might differ from this.\r\n\r\nThe expansion to the 2016 hit game adds a 6th player and introduces a new team mode with simultaneous play, character-specific weapons and gadgets, and new damage mechanics.\r\n', 7, '20', '2-6', 90, 14, 'Neduk, Filip', 'Czech Games \r\nEdition'),
(21, 'Villages of Valeria', 'A village-building card game set in the world of Valeria. Establish resources, construct buildings, and attract adventurers to your Village to be crowned the next capitol city.', 12, '20', '1-5', 60, 14, 'Holzgrafe, Rick + Vallejo, Isaias', 'Daily Magic Games'),
(22, 'Michael Strogoff', 'In Michael Strogoff, based on the Jules Verne novel of the same name, players race to deliver a message to the brother of the Czar, while simultaneously racing both an assassin sent to the kill that man and Tartar forces moving on Moscow. Players must help one another hold off the latter threats, while still trying to be the first to deliver that message.', 5, '30', '1-5', 60, 12, 'Corral, Alberto', 'Devir Iberia SL'),
(23, 'Mystic ScROLLS', 'Mystic ScROLLS is a real-time dice game in which each player is a wizard trying to cast as many spells as possible to capture the mystic knowledge of the hidden scrolls. It plays for 2-4 players, 12 years old and up, and each game lasts around 20 minutes giving you a fun game filled with adrenaline.', 3, '25', '2-4', 25, 8, 'Kourtis, Stelios + Foskolos, \r\nEvangelos', 'Draw Lab \r\nEntertainment'),
(24, 'Indian Summer', 'Before winter makes its appearance, a particularly warm fall bathes the forest in a golden shimmer. During the Indian Summer, New England blossoms one last time. Treetops are ablaze with countless colors — a living rainbow, from green to orange to red. Slowly the first leaves are starting to fall. Meanwhile, our steps and the diligent squirrels rustle the colorful foliage.', 10, '35', '1-4', 60, 10, 'Rosenberg, Uwe', 'Edition Spielwiese'),
(25, 'Metal Dawn', 'In Metal Dawn, a networked rogue satellite military defense system named Dominus has revolted against its makers, turning its machines of war towards eradicating mankind in a cybernetic revolution. The players are a united faction of agents whose mission is to destroy the forces of the machine while hacking the network to take down the satellite before it’s too late.', 6, '50', '1-4', 90, 14, 'Batarlis, Chris + Avery, Steve', 'Everything Epic \r\nGames');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_comments`
--

CREATE TABLE `product_comments` (
  `product_ID` int(11) NOT NULL,
  `comment_ID` int(11) NOT NULL,
  `comment_text` text COLLATE utf8_bin NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Zrzut danych tabeli `product_comments`
--

INSERT INTO `product_comments` (`product_ID`, `comment_ID`, `comment_text`, `comment_date`) VALUES
(1, 1, 'asdasd', '0000-00-00 00:00:00'),
(1, 2, 'asdasd', '2017-11-08 00:00:00'),
(1, 3, 'asdasd', '2017-11-08 00:00:00'),
(1, 4, 'test', '2017-11-08 00:00:00'),
(1, 5, 'test', '2017-11-08 00:00:00'),
(1, 6, 'test', '2017-11-08 00:00:00'),
(1, 7, 'asdasd', '2017-11-08 00:00:00'),
(1, 8, 'asdasd', '2017-11-08 00:00:00'),
(1, 9, 'asdasd', '2017-11-08 00:00:00'),
(1, 10, 'asdasd', '2017-11-08 00:00:00'),
(1, 11, 'test', '2017-11-08 12:07:00'),
(2, 12, 'kjnjk', '2017-11-08 12:16:00'),
(4, 13, 'asdasd', '2017-11-21 16:58:00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`comment_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `comment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;--
-- Baza danych: `dreamphotos`
--
CREATE DATABASE IF NOT EXISTS `dreamphotos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dreamphotos`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date_created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `picture`
--

INSERT INTO `picture` (`id`, `user_id`, `date_created`) VALUES
(9, 9, '2017-05-03'),
(10, 9, '2017-05-03'),
(11, NULL, '2017-05-03'),
(12, NULL, '2017-05-03'),
(13, NULL, '2017-05-03'),
(14, NULL, '2017-05-03'),
(15, NULL, '2017-05-03'),
(16, NULL, '2017-05-03'),
(17, NULL, '2017-05-03'),
(18, NULL, '2017-05-03'),
(19, NULL, '2017-05-03'),
(20, NULL, '2017-05-03'),
(21, NULL, '2017-05-03'),
(22, NULL, '2017-05-03'),
(23, NULL, '2017-05-03'),
(24, NULL, '2017-05-03'),
(25, NULL, '2017-05-03'),
(26, NULL, '2017-05-03'),
(27, NULL, '2017-05-03'),
(28, NULL, '2017-05-03'),
(29, NULL, '2017-05-03'),
(30, NULL, '2017-05-03'),
(31, NULL, '2017-05-03'),
(32, NULL, '2017-05-03'),
(33, NULL, '2017-05-03'),
(34, NULL, '2017-05-03'),
(35, NULL, '2017-05-03'),
(36, NULL, '2017-05-03'),
(37, NULL, '2017-05-03'),
(38, NULL, '2017-05-03'),
(39, NULL, '2017-05-03'),
(40, NULL, '2017-05-03'),
(41, NULL, '2017-05-03'),
(42, NULL, '2017-05-03'),
(43, NULL, '2017-05-03'),
(44, NULL, '2017-05-03'),
(45, NULL, '2017-05-03'),
(46, NULL, '2017-05-03'),
(47, NULL, '2017-05-03'),
(48, 9, '2017-05-03'),
(49, 9, '2017-05-03'),
(50, 10, '2017-05-03'),
(62, NULL, '2017-05-08'),
(63, NULL, '2017-05-08'),
(64, NULL, '2017-05-08'),
(75, NULL, '2017-05-08');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf16le NOT NULL,
  `lastName` varchar(255) CHARACTER SET utf16le NOT NULL,
  `password` varchar(255) NOT NULL,
  `joined` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `firstName`, `lastName`, `password`, `joined`) VALUES
(7, 'mikolaj_admin', 'mikolaj.m.szewczyk@gmail.com', 'Mikołaj', 'Szewczyk', 'd4ZAleTZj4nqE', '2017-05-02'),
(9, 'test_user', 'testWgk@asd', 'asdsad', 'asdasd', 'd4uHefuBZQW2I', '2017-05-03'),
(10, 'Ethari', 'mikolaj.m.szewczyk@gmail.com', 'Mikołaj', 'Szewczyk', 'd4ZAleTZj4nqE', '2017-05-03'),
(11, 'miko_admin', 'mikolajsz1993@gmail.com', 'Mikolaj', 'Szewczyk', 'd4ZAleTZj4nqE', '2017-05-08');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `picture`
--
ALTER TABLE `picture`
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
-- AUTO_INCREMENT dla tabeli `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;--
-- Baza danych: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Zrzut danych tabeli `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"testing_app\",\"table\":\"generated_test\"},{\"db\":\"testing_app\",\"table\":\"test_results\"},{\"db\":\"testing_app\",\"table\":\"test_student_answers\"},{\"db\":\"testing_app\",\"table\":\"question_types\"},{\"db\":\"testing_app\",\"table\":\"test_schedule\"},{\"db\":\"testing_app\",\"table\":\"test\"},{\"db\":\"testing_app\",\"table\":\"student\"},{\"db\":\"testing_app\",\"table\":\"user\"},{\"db\":\"testing_app\",\"table\":\"multiple_choice_question\"},{\"db\":\"boardgamestore\",\"table\":\"category\"}]');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Zrzut danych tabeli `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'dreamphotos', 'picture', '{\"sorted_col\":\"`picture`.`id`  ASC\"}', '2017-05-03 16:01:54'),
('root', 'testing_app', 'generated_test', '{\"CREATE_TIME\":\"2017-11-20 18:14:59\",\"col_order\":[\"0\",\"3\",\"1\",\"2\",\"4\",\"5\"],\"col_visib\":[\"1\",\"1\",\"1\",\"1\",\"1\",\"1\"]}', '2017-11-20 17:50:18'),
('root', 'testing_app', 'question', '{\"sorted_col\":\"`question`.`id`  DESC\"}', '2017-06-07 15:13:25'),
('root', 'testing_app', 'student', '{\"sorted_col\":\"`id`  DESC\"}', '2017-11-06 18:19:50'),
('root', 'testing_app', 'true_false_question', '{\"sorted_col\":\"`true_false_question`.`id` ASC\"}', '2017-11-11 18:53:35');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Zrzut danych tabeli `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-05-23 20:00:43', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"lang\":\"pl\"}');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Baza danych: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Baza danych: `testing_app`
--
CREATE DATABASE IF NOT EXISTS `testing_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `testing_app`;

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
(23, 26, 191, 'a:6:{i:0;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:3;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}}}}', 1511347739, 1),
(24, 27, 191, 'a:6:{i:0;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:1;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}}i:3;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}}}}', 1511615901, 1),
(25, 28, 191, 'a:6:{i:0;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}}i:1;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:3;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:4;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}}}', 1511621328, 1),
(26, 29, 191, 'a:8:{i:0;a:6:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";}i:1;a:7:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}}i:2;a:7:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}}i:3;a:7:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";}}}i:4;a:7:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}}}i:5;a:7:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";}}}i:6;a:7:{s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:20:\"<p>Some question</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"37\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"2\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"36\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"38\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"3\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"39\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:5:\"false\";}}}i:7;a:7:{s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:437:\"<p style=\"text-align: left;\">What is the value of that function?</p>\n<pre class=\"language-php\"><code>    public function insertQuestionBase($attributes){\n        $values = $attributes;\n        $values[\'date_added\'] = date(\'Y-m-d H:i:s\');\n        ChromePhp::log($values);\n        $this-&gt;db-&gt;insert(\'question\', $values);\n        $id = $this-&gt;db-&gt;insert_id();\n        ChromePhp::log($id);\n\n        return $id;\n    }</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"3\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"2\";s:6:\"answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:5:\"false\";}}}}', 1511622888, 1);

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
(25, 'a:8:{i:0;a:12:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:5:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:0;s:13:\"wrong_answers\";i:1;s:15:\"positive_points\";d:0;s:15:\"negative_points\";d:-1;s:12:\"total_points\";d:-1;}i:1;a:12:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:5:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:5:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:2;a:5:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:2;s:13:\"wrong_answers\";i:1;s:15:\"positive_points\";d:2;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:2;}i:2;a:12:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:5:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:4;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:4;}i:3;a:7:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";s:6:\"answer\";s:25:\"This answer should appear\";}s:17:\"manual_evaluation\";b:1;i:4;a:12:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:5:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:4;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}i:5;a:12:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:5:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}s:12:\"total_points\";d:7;}', 0),
(26, 'a:10:{i:0;a:7:{s:11:\"question_id\";s:2:\"54\";s:11:\"description\";s:420:\"<pre class=\"language-javascript\"><code>function generateQuestionPage(test_questions){\n    $(\'#pagination-container\').pagination({\n        dataSource: test_questions,\n        pageSize: 1,\n        className: \'\',\n        callback: function(data, pagination) {\n            // template method of yourself\n            var html = questionList(data);\n            $(\'#data-container\').html(html);\n        }\n    });\n}</code></pre>\";s:4:\"type\";s:13:\"open_question\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:2:\"-2\";s:14:\"automatic_eval\";s:1:\"0\";s:6:\"answer\";s:18:\"This is my answer.\";}s:17:\"manual_evaluation\";b:1;i:1;a:12:{s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:114:\"<p><strong>Frequent use of sprays, oils, and antiseptics in the nose during a bad cold may result in:</strong></p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:2:\"-1\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"14\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:33:\"destruction of white blood cells.\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"13\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:30:\"damage to the olfactory nerve.\";s:6:\"answer\";s:5:\"false\";}i:2;a:5:{s:2:\"id\";s:2:\"15\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:45:\"congestion of the mucous membrane in the nose\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"12\";s:11:\"question_id\";s:2:\"37\";s:11:\"description\";s:46:\"the spreading of the infection to the sinuses.\";s:6:\"answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:0;s:13:\"wrong_answers\";i:1;s:15:\"positive_points\";d:0;s:15:\"negative_points\";d:-1;s:12:\"total_points\";d:-1;}i:2;a:12:{s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:146:\"<p>The threat of rain didn&rsquo;t &hellip; her stroll through the grounds. Even the first drops were no &hellip;, and she continued her walk.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:5:{s:2:\"id\";s:2:\"18\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"impede … deterrent\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"16\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:20:\"hinder … incentive\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"19\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:22:\"permit … provocation\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"17\";s:11:\"question_id\";s:2:\"38\";s:11:\"description\";s:17:\"thwart … refuge\";s:6:\"answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}i:3;a:12:{s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:836:\"<pre class=\"language-markup\"><code>&lt;div class=\"panel panel-default\"&gt;\n            &lt;div class=\"panel-heading\"&gt;\n                &lt;h3 class=\"panel-title\"&gt;&lt;i class=\"fa fa-bar-chart-o fa-fw\"&gt;&lt;/i&gt; Tests&lt;/h3&gt;\n            &lt;/div&gt;\n            &lt;div class=\"panel-body\"&gt;\n                &lt;div id=\"tests_list\"&gt;\n                    &lt;div id = \"group_success\" class=\"alert alert-success alert-dismissible\" role=\"alert\" style = \"display:none;\"&gt;\n                        &lt;button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"&gt;\n                            &lt;span aria-hidden=\"true\"&gt;&amp;times;&lt;/span&gt;\n                        &lt;/button&gt;\n                        &lt;strong&gt;Success!&lt;/strong&gt; Test created.\n                    &lt;/div&gt;</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"4\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:4:{i:0;a:4:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"B\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"C\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:1:\"D\";s:6:\"answer\";s:5:\"false\";}i:3;a:5:{s:2:\"id\";s:2:\"29\";s:11:\"question_id\";s:2:\"49\";s:11:\"description\";s:20:\"This code looks good\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:4;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:4;}i:4;a:12:{s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:553:\"<p>asdasdasd</p>\n<pre class=\"language-php\"><code>sts = $this-&gt;Tests_Model-&gt;getTests(1);\n        $data = array(\n            \'tests\' =&gt; $tests\n        );\n\n        $this-&gt;loader-&gt;generateAdminPage(\'tests\', $data);\n    }\n\n    public function details($id){\n        $result = $this-&gt;Questions_Model-&gt;getQuestionDetails($id);\n        echo \"&lt;pre&gt;\";\n        print_r($result);\n        echo \"&lt;/pre&gt;\";\n    }\n\n    public function new_test(){\n        $id = $this-&gt;Tests_Model-&gt;createTest();\n        echo $id;\n    }\n</code></pre>\";s:4:\"type\";s:10:\"true_false\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:3:{i:0;a:5:{s:2:\"id\";s:2:\"31\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:2:\"23\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:5:{s:2:\"id\";s:2:\"32\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:2;a:5:{s:2:\"id\";s:2:\"30\";s:11:\"question_id\";s:2:\"55\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:5:\"false\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:2;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}i:5;a:12:{s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:116:\"<p>Jane is a(n) &hellip; student. She reads every page of her textbooks and studies for hours before every test.</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"1\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"1\";s:7:\"answers\";a:5:{i:0;a:4:{s:2:\"id\";s:2:\"22\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"apathetic\";s:6:\"answer\";s:5:\"false\";}i:1;a:4:{s:2:\"id\";s:2:\"21\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:13:\"lackadaisical\";s:6:\"answer\";s:5:\"false\";}i:2;a:4:{s:2:\"id\";s:2:\"23\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:7:\"relaxed\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"24\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:9:\"lethargic\";s:6:\"answer\";s:5:\"false\";}i:4;a:5:{s:2:\"id\";s:2:\"20\";s:11:\"question_id\";s:2:\"39\";s:11:\"description\";s:10:\"meticulous\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}}s:15:\"correct_answers\";i:1;s:13:\"wrong_answers\";i:0;s:15:\"positive_points\";d:1;s:15:\"negative_points\";d:0;s:12:\"total_points\";d:1;}i:6;a:7:{s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:20:\"<p>Some question</p>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"2\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:5:{s:2:\"id\";s:2:\"37\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"2\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:4:{s:2:\"id\";s:2:\"36\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:4:\"true\";}i:2;a:5:{s:2:\"id\";s:2:\"38\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"3\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:3;a:4:{s:2:\"id\";s:2:\"39\";s:11:\"question_id\";s:2:\"52\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:5:\"false\";}}}i:7;a:7:{s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:437:\"<p style=\"text-align: left;\">What is the value of that function?</p>\n<pre class=\"language-php\"><code>    public function insertQuestionBase($attributes){\n        $values = $attributes;\n        $values[\'date_added\'] = date(\'Y-m-d H:i:s\');\n        ChromePhp::log($values);\n        $this-&gt;db-&gt;insert(\'question\', $values);\n        $id = $this-&gt;db-&gt;insert_id();\n        ChromePhp::log($id);\n\n        return $id;\n    }</code></pre>\";s:4:\"type\";s:15:\"multiple_choice\";s:21:\"correct_answer_points\";s:1:\"3\";s:23:\"incorrect_answer_points\";s:1:\"0\";s:14:\"automatic_eval\";s:1:\"0\";s:7:\"answers\";a:4:{i:0;a:5:{s:2:\"id\";s:2:\"27\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"3\";s:6:\"answer\";s:5:\"false\";s:14:\"student_answer\";s:4:\"true\";}i:1;a:5:{s:2:\"id\";s:2:\"26\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"2\";s:6:\"answer\";s:4:\"true\";s:14:\"student_answer\";s:4:\"true\";}i:2;a:4:{s:2:\"id\";s:2:\"28\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"4\";s:6:\"answer\";s:5:\"false\";}i:3;a:4:{s:2:\"id\";s:2:\"25\";s:11:\"question_id\";s:2:\"42\";s:11:\"description\";s:1:\"1\";s:6:\"answer\";s:5:\"false\";}}}s:12:\"total_points\";d:6;}', 0);

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
(26, 11, '2017-11-22 10:54:00', '2017-11-22 14:54:00', 'end_of_exam', 40, NULL),
(27, 11, '2017-11-25 14:17:00', '2017-11-25 22:17:00', 'end_of_exam', 120, NULL),
(28, 11, '2017-11-25 15:48:00', '2017-11-25 21:48:00', 'end_of_exam', 200, NULL),
(29, 11, '2017-11-25 16:14:00', '2017-11-25 20:14:00', 'end_of_exam', 200, NULL);

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
(26, 22),
(27, 22),
(28, 22),
(29, 22);

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
(23, 191, 55, 32, 'true'),
(24, 191, 37, 12, 'false'),
(24, 191, 37, 15, 'true'),
(24, 191, 38, 18, 'true'),
(24, 191, 39, 20, 'true'),
(24, 191, 39, 24, 'false'),
(24, 191, 49, 29, 'true'),
(24, 191, 54, 0, 'Some answer'),
(24, 191, 55, 30, 'true'),
(24, 191, 55, 31, 'true'),
(24, 191, 55, 32, 'false'),
(25, 191, 37, 15, 'true'),
(25, 191, 38, 18, 'true'),
(25, 191, 39, 20, 'true'),
(25, 191, 49, 29, 'true'),
(25, 191, 54, 0, 'This answer should appear'),
(25, 191, 55, 30, 'true'),
(25, 191, 55, 31, 'true'),
(25, 191, 55, 32, 'true'),
(26, 191, 37, 15, 'true'),
(26, 191, 38, 18, 'true'),
(26, 191, 39, 20, 'true'),
(26, 191, 42, 26, 'true'),
(26, 191, 42, 27, 'true'),
(26, 191, 49, 29, 'true'),
(26, 191, 52, 37, 'true'),
(26, 191, 52, 38, 'true'),
(26, 191, 54, 0, 'This is my answer.'),
(26, 191, 55, 30, 'false'),
(26, 191, 55, 31, 'true'),
(26, 191, 55, 32, 'true');

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
(11, 38, 1, 0, 1),
(11, 42, 3, 0, 0),
(11, 52, 2, 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
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

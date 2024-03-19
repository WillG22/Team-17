-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 18 mars 2024 à 22:32
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `WineShop`
--

-- --------------------------------------------------------

--
-- Structure de la table `baskets`
--

CREATE TABLE `baskets` (
  `basket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `basket_items`
--

CREATE TABLE `basket_items` (
  `id` int(11) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Categories`
--

CREATE TABLE `Categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Categories`
--

INSERT INTO `Categories` (`id`, `name`) VALUES
(1, 'Red wine'),
(3, 'Rosé wine'),
(5, 'Sparkling wine'),
(4, 'Sweet wine'),
(2, 'White wine');

-- --------------------------------------------------------

--
-- Structure de la table `contactus`
--

CREATE TABLE `contactus` (
  `ID` int(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `Message` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contactus`
--

INSERT INTO `contactus` (`ID`, `Name`, `email`, `subject`, `Message`) VALUES
(4, 'Dhgvbjknl,;oribv ,;angcfhvbjknl,m;ù', 'aurelien.goncalves@outlook.fr', 'rdextcyvgubhijn', 'cdfghvbjn'),
(5, 'ezfuh', 'aurelien.goncalves@outlook.fr', 'jbhkn', ' bon,;'),
(6, 'aurelien', 'aurelien.goncalves@outlook.fr', 'team 17', 'best team of ever'),
(7, 'aurelien', '220039116@aston.ac.uk', 'zeds', 'azfecqs');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `type`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `basket_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `transaction_id`, `role_id`, `basket_id`) VALUES
(2, 'Aurélien', 'aurelien.goncalves@outlook.fr', '$2b$10$HTQizgCpIyOYzHQxwdxI7OQokmYd5LBMFGugLbAqjCzOz44CO4oca', NULL, 1, NULL),
(11, 'admin', 'admin@aston.ac.uk', '$2b$10$qX440oJU9Yx5NeEng96vleBnIbVW3tSOH77EuhF6M/xBbw0Mi49by', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Wines`
--

CREATE TABLE `Wines` (
  `Categories` varchar(255) NOT NULL,
  `Id` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Price` decimal(10,0) NOT NULL,
  `Description` text NOT NULL,
  `WinePicture` varchar(255) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Wines`
--

INSERT INTO `Wines` (`Categories`, `Id`, `Year`, `Name`, `Price`, `Description`, `WinePicture`, `Quantity`) VALUES
('Red Wine', 3, 2005, 'Château Latour ', 6500, 'Five minutes after you had swallowed this wine you could still taste it in its entirety. Even by Latour\'s lofty standards this is remarkable. This is a huge, dense closed wine packed full of cassis, cream and minerals of awesome intensity. As you might expect, the tannins here are phenomenally rich and ripe It surely has a long and glorious future ahead of it, with no sharp edges and a wonderful grace and balance. This will be one of the all time great Latours.', 'Château Latour 2005.png', 30),
('Red Wine', 4, 2004, 'Château Latour ', 3800, 'This sensational Latour left us totally speechless when we tasted it - a monumental task indeed when Berrys\' Sales Director Simon Staples is present. The 2004 has the highest ever percentage of Cabernet (90%) in the final blend - usually it\'s around 80% - and is one which Director Frédéric Engerer likens to their astonishing 1996. The nose is dense and intense with deep black fruits yet without clumsiness or over extraction - just defined, cool and precise. The palate is powerful and majestic with its sweet raspberries and licorice following through to an indecently long finish. This Latour has great structure, great precision and is a great wine.', 'Château Latour 2004.png', 30),
('Red Wine', 5, 2010, 'Château Rauzan Ségla ', 1425, '\"To reiterate, the 2010 Rauzan Segla is like a super-duper version of the 1986. Displaying fabulous density, an inky purple color and a superb nose of forest floor with a hint of menthol as well as loads of creme de cassis, mocha and touches of chocolate and subtle oak, this full-bodied, deep, concentrated wine represents only 45% of the estate\'s production. It is certainly not for those who can\'t wait a few years for it to round into shape, as I suspect it needs at least 5-8 years of bottle-age, but it should last for half a century or more. A stunning wine from Rauzan Segla, kudos go to administrator John Kolasa for turning out this profound wine, which should prove to be a timeless classic from the appellation of Margaux.\"\r\n95+\r\nRobert Parker, Wine Advocate (205), March 2013\r\n\r\n\"Beautiful clarity of fruit with raspberries and currants on the nose. Roses and other flowers too. It\'s almost hard to describe, but there\'s a real purity. Full body, with fabulous balance and depth. It has everything in the right place. Best ever? Try it in 2018.\"\r\n98\r\nJames Suckling, JamesSuckling.com, February 2013', 'Château Rauzan Ségla 2010, Margaux - 6 Litre.png', 30),
('White Wine', 6, 2018, 'Château d\'Yquem', 1440, 'ABV 14%\r\n\r\n\"As ever with Yquem, patience was the key, taking in the grapes slowly but surely over 17 days harvest that extended well into October. The results in the glass are intense and glossy, full of satin-textured apricot and white peach flavours. There are exotic fruits of pineapple and mango but winemaker Sandrine Garbay has kept a focus on fresher flavours of lime zest and citrus that balance out the natural richness and concentration. Pretty closed right now, but there is power and balance here, an excellent Yquem.\"\r\nJane Anson, Decanter 97/100', 'Château d\'Yquem 2018, 1er Cru Classé, Sauternes.png', 30),
('White Wine', 7, 1990, 'Château d\'Yquem ', 5400, 'ABV 14.0%\r\n\r\n\"An extraordinary effort, Yquem\'s 1990 is a rich and fabulously superb, sweet wine. This wine also possesses lots of elegance and finesse. The wine\'s medium gold color is accompanied by an exceptionally sweet nose of honeyed tropical fruits, peaches, coconut, and apricots. High quality, subtle toasty oak is well-integrated. The wine is massive on the palate, with layers of intensely ripe botrytis-tinged, exceptionally sweet fruit. Surprisingly well-integrated acidity, and a seamless, full-bodied power and richness have created a wine of remarkable harmony and purity. Certainly it is one of the richest Yquems I have ever tasted, with 50-100 years of potential longevity. An awesome Yquem! Anticipated maturity: 2003-2050+.\"\r\n99\r\nRobert Parker, Wine Advocate (122), April 1999', 'Château d\'Yquem 1990, 1er Cru Classé.png', 30),
('White Wine', 8, 2018, 'Aile d\'Argent ', 1110, 'he 2016 Aile d’Argent underwent a high percentage of malolactic fermentation (27%). It has a generous, expressive bouquet of honeysuckle, beeswax and lime flower aromas, and just a light oily/Riesling note in the background. The palate is well balanced and crisp, with a fine line of acidity and a touch of stem ginger and orange peel toward the finish. This is beautifully balanced and long, and while not quite in the league of the 2015 Aile d’Argent, it is seriously delicious.\" Drink 2022-2038\r\nScore: 92 Neal Martin, vinous.com (Jan 2019), January 2019', 'Aile d\'Argent 2018, Chateau Mouton Rothschild.png', 30),
('Rosé Wine', 9, 2021, 'Rock Angel Rosé', 699, 'Rock Angel is a more sophisticated version of Whispering Angel. The grapes are grown at the Chateau d\'Esclans vineyards and consisting of Grenache and Rolle (Vermentino). Owner Sacha Lichine and oenologist Patrick Leon (formerly from Chateau Mouton Rothschild) who sadly passed away late last year have produced a truly magnificent wine. This wine has plenty of depth and a clean fresh hint of grapefruit, lemon and strawberry. Good structure with a long finish.\r\n\r\n“What a stunner it is. A refined refreshing rosé.”\r\nWill Lyons (The Wall Street Journal)\r\n\r\n“A pure and unadorned style”\r\nThe Wine Spectator\r\n\r\n“The most serious & rewarding Rock Angel of all time” 18.5/20\r\nMatthew Jukes\r\n\r\n“Good depth of flavor from the zest and red berry fruits”\r\nRoger Voss (Wine Enthusiast)\r\n\r\n“Fully textured palate and more than expected”\r\nSteven Spurrier\r\n\r\n“Full body, focused & vibrant” 92/100\r\nJames Suckling', 'Rock Angel Rosé 2021 - Methuselah 900cl.png', 30),
('Rosé Wine', 10, 2022, 'Château Minuty', 299, 'ABV 12.5%\r\n\r\nThe pale hue and translucent reflections of this rosé heralds a delicate wine with an intense and complex bouquet. The fineness of white fruit aromas is disclosed through iodine notes, giving it a unique character.\r\n\r\nGRAPES VARIETIES USED\r\nGrenache, Syrah, Cinsault\r\n\r\nSOIL / CLIMATE\r\nA clonal selection from our assortment of Grenache vines that are on average 25 years old, nurtured by the maritime influences found in the terroir.\r\n\r\nVINIFICATION\r\nThe grapes are harvested by hand. De-stemming and crushing are followed by cooling and inert gas injection. Free-run juices are selected. Alcoholic fermentation at 14°C.\r\n\r\nTASTING NOTES\r\nColour : Pale with translucent reflections.\r\nNose : Strong intensity with beautiful complexity and an aromatic fineness of white fruit (peach, melon...), accentuated by iodine notes.\r\nFlavors : Great depth with a mineral structure.\r\n\r\nFOOD AND WINE PAIRING\r\nScallop risotto, grilled Dublin Bay prawns, backed John Dory with fennel\r\n\r\n ', 'Château Minuty 281, 2022 - Jeroboam 300cl.png', 30),
('Rosé Wine', 11, 2020, 'Château d\'Esclans Garrus ', 959, 'ABV 13.5%\r\n\r\nPrevious vintage 2019 review-\r\n\r\n\"Garrus is always awesome and, every so often, it is completely unpredictable.  The 2019s from Château d’Esclans are sublime and Garrus ought to be the most obviously masculine and imposing in the portfolio but, strangely, I felt that the perfume and the initial attack was positively gentle and come-hither in its composure and allure.  So, I did what any right-minded person would do and relaxed into another sip.  I then realised that I had been tricked!  Garrus is as structured and proud as ever and yet it is sporting a kindly disguise to lull you into a false sense of security.  Many will drink this wine too early, fooled by the glossiness and initial enchantment on offer.  But they will soon realise that this wine’s finish is firm and unyielding, pointing to a long and graceful life – as long as you have the patience.  This is a sensational vintage for Garrus and I rate it as highly as the epic 2015 and that means that this is a perfect 20/20 in my notes.  Nothing comes close in 2019 (apart from its sibling, Les Clans) and I have tasted hundreds of bottles.  The difference between this wine and the 2015 is that the ’15 was very obviously statuesque with amazing flanks and bold musculature.  By contrast, this 2019 is subtle, brooding, complex and intricately perfumed.  The nose is cool and soothing and the palate is a veritable iceberg of power and equilibrium and while we can only sense the scale of grandeur of this wine, the signposts on the surface are already devastatingly attractive.  You simply must buy and keep this wine for at least twelve months before you pop a cork!\"  \r\n\r\n20+/20 Drink 2021 – 2027\r\n\r\nMatthewjukes.com 28/10/2020\r\n\r\nGarrus from chateau d\'Esclans was first produced in 2006 and has already received praise from some of the World\'s most respected wine critics (see below). Grape variety includes Grenache and Rolle. It is a very complex wine and has distinct strawberry, apple and lemon flavours with a long finish.\r\n\r\n“Greatest Rosé ever”\r\n98/100 James Suckling\r\n\r\n“I sense that Garrus will, one day, be mentioned in the same breath as wines like La Tâche, Latour, Vieilles Vignes Françaises and Le Montrachet”\r\n20/20 Matthew Jukes\r\n\r\n“This is as fine a rosé as you will ever find”\r\nJonathan Ray (The Spectactor)\r\n\r\n“Best rosé in the world? I’m impressed!”\r\nJancis Robinson (Master of Wine)\r\n\r\n“I was blown away”\r\nTom Stevenson (Sotheby’s Wine Encyclopedia)\r\n\r\n“Achieving cult status”\r\nAnthony Dias Blue (Patterson’s Tasting Panel Magazine)\r\n\r\n“This full-bodied wine pushes the concept of rosé to its limits”\r\nRoger Voss (Wine Enthusiast)\r\n\r\n“Taking rosé to a level it has never been before”\r\nRichard Nalley (Forbes Magazine)\r\n\r\n“Sacha Lichine has cracked it”\r\nSerena Sutcliffe (Master of Wine)\r\n\r\n“Refined, tight and almost white”\r\nDrinks Business\r\n\r\n“A gorgeous rosé”\r\nWine Spectator\r\n\r\n“This estate in the Côtes de Provence produces dazzling rosés”\r\nRobert Parker (The Wine Advocate)', 'Château d\'Esclans Garrus Rosé 2020.png', 30),
('Sweet Wine', 12, 1921, 'Climens ', 1500, 'Premier Cru Classé Sauternes wine producer from the Barsac appellation, Château Climens boasts a reputation for producing world-class sweet wines. A rare find from the 1921 vintage, long considered one of the best Sauternes and Barsac vintages of the 20th century.', 'Climens (Missing Label) 1921.png', 30),
('Sweet Wine', 13, 1791, 'Constantia Sweet Wine Half ', 33800, 'Vin de Constance holds a fascinating historical legacy. This iconic sweet wine hails from South Africa and traces its origins to the late 17th century. The estate where it is now produced, Klein Constantia, was established in 1685 by Simon van der Stel, the first Governor of the Cape Colony. Vin de Constance gained prominence in the 18th and 19th centuries, particularly during the time of Napoleon Bonaparte. It was reported that Napoleon himself was an admirer of this luscious nectar, which led to its reputation spreading across Europe. The extremely rare half-bottle of 1791 Vin de Constance is a remarkable relic of history, encapsulating centuries of winemaking heritage.\r\n\r\nFree delivery on orders over £200 or 6 bottles\r\nGift wrapping available at checkout\r\n', 'Constantia Sweet Wine Half 1791.png', 30),
('Sweet Wine', 14, 2018, 'Egon Muller Scharzhofberger Riesling Trockenbeerenauslese Half ', 9360, 'Based in Germany’s Mosel region, Weingut Egon Müller is widely regarded as one of the world’s finest white wine producers and the highly revered Scharzhofberg vineyard is the source of some of the greatest Riesling in the country. From the low-yielding but exceptional 2019 vintage, this is an exceptional release made in the incredibly sweet Trockenbeerenauslese style. Scoring it a perfect 100 points in The Wine Advocate, Stephan Reinhardt described it as “inimitable” and “incomparable” with a finish that is “nothing short of endless” and a drinking window of 2030 to 2100.', 'Egon Muller Scharzhofberger Riesling Trockenbeerenauslese Half 2018.png', 30),
('Sparkling Wine', 15, 2002, 'Amour de Deutz ', 5300, 'A blanc de blancs prestige cuvée from Champagne Deutz. From the sensational 2002 vintage, this wine shows great purity of fruit and exceptional finesse.\r\n', 'Amour de Deutz 600cl 2002.png', 30),
('Sparkling Wine', 16, 1989, 'Bollinger Grande Annee Magnum ', 1020, 'La Grande Année` from Bollinger was first produced in the year 1976. The cuvée was created to represent an outstanding vintage, showcasing the finest expression of Bollinger`s winemaking prowess. `La Grande Année` is crafted only in exceptional years when the harvest yields grapes of exceptional quality and maturity. The 1989 vintage is a blend of 61% Pinot Noir and 39% Chardonnay, with a dosage of 6g/l. Expect notes of orchard fruit, vanilla, macadamia nuts, and an enduring minerality.', 'Bollinger Grande Annee Magnum 1989.png', 30),
('Sparkling Wine', 17, 1997, 'Bollinger Vieilles Vignes Francaises ', 1880, 'Bollinger’s ‘Vieilles Vignes Françaises’ is a Blanc de Noirs champagne made from 100% Pinot Noir grapes that are grown in the oldest, ungrafted vines in Bollinger`s vineyards. The grapes are harvested by hand and fermented in small oak barrels. The wine is then aged for a minimum of 10 years before being released. The 1997 vintage displays a golden hue and a fine, persistent mousse. On the nose, expect enticing aromas of ripe red fruits, such as cherries and raspberries, intertwined with hints of floral notes, spices, and toasted nuances. The palate is rich, structured, and layered, with a velvety texture and a long, satisfying finish.', 'Bollinger Vieilles Vignes Francaises 1997.png', 30),
('White Wine', 18, 2001, 'Chateau d’Yquem', 839, 'The 2001 Château d’Yquem is undoubtedly one of the greatest Sauternes ever made and has near limitless potential longevity. It is kaleidoscopically complex and incredibly powerful, with simply staggering balance, precision and detail. On the nose it is utterly beguiling, offering intricate layers of honeyed stone fruits, citrus peel, almond paste, crème brûlée, toasted nuts and liquidised stones. The palate achieves levels of richness and intensity very rarely possible, with laserlike acidity providing remarkable levity and drive through to the brilliantly long, multi-layered finish. Once tried, the 2001 is never forgotten.', '2001 Chateau d’Yquem.png', 30),
('White Wine', 19, 2015, 'LOUIS ROEDERER CRISTAL 75C', 700, 'Louis Roederer Cristal 2015 is a highly esteemed Grande Marque\'s prestige cuvée, and is one of Champagne\'s most iconic wines. Cristal 2015 was assembled from 45 plots from 7 villages, including Verzenay, Verzy, Beaumont-sur-Vesle, Aÿ, Avize, Le Mesnil-sur-Oger and Cramant. Each plot was vinified separately, so as to fully express each vineyard\'s soil and microclimate. The vineyards are cultivated using biodynamic methods, augmenting the relationship between the vines, soil, and light. 25% of the wine was fermented in oak barrel, adding a layer of richness and complexity, and malolactic fermentation is avoided, maintaining the freshness and purity of the fruit. Ageing on lees sur latte lasted for between 6 and 7 years, and the bottles were held back for a further 6 to 12 months post-disgorgement.\r\n\r\nThis masterpiece is true to Cristal\'s signature style, with incredible precision and complex yet delicate perfume. There is no doubt that the rich and toasty side of Cristal will be revealed after 5 to 10 years of further ageing.', 'Louis Roederer Cristal.png', 30),
('Rose Wine', 20, 2006, 'Moet & Chardon', 1012, 'Möet & Chandon Brut Imperial is a champagne that offers vibrant notes of green apple and citrus fruits on the nose accompanied by mineral nuances, hints of white flowers as well as aromas of brioche and fresh nuts that is typical of the aging process. On the palate it is generous and subtle, bringing back the white fruit and stone fruit with notes of gooseberries accompanied by a well integrated bub', 'Moet & Chardon.png', 30),
('Sweat Wine', 21, 2019, 'Inniskillin Gold Niagara Vidal Icewine ', 1201, 'Inniskillin Gold Vidal Icewine is deep gold in colour, the icewine has abundant aromatics of apricot, peach and pineapple. Full-bodied, with flavours of mango, clove and orange peel which continue through the long finish, all held together by crisp bold acidity.', 'inniskillin.png', 30),
('Sweet Wine', 22, 1984, 'Chateau d\'Yquem', 1, 'Yquem is indisputedly the best wine in Sauternes and may well be the finest sweet wine in the world.\r\n\r\nReviews \"1984 is a surprisingly good year made under very trying conditions. D\'Yquem began its harvest on October 15th and made its last pass through the vineyards on November 13th. Seventy-five percent of the crop was retained for d\'Yquem. The wine at present exhibits a great deal of smoky oak in its bouquet, which is also filled with scents of smoked almonds, cooked pineapples, and honey and caramel. In the mouth, the wine is less flamboyant, with less glycerin and power than usual, but it is still a rich, full-bodied d\'Yquem with a great deal of personality and character.\" ERobert Parker', 'Chateau d\'Yquem 1984.png', 30),
('Rose Wine', 23, 2012, 'EXTON PARK ROSÉ MAGNUMS', 604, '70% Pinot Noir and 30% Pinot Meunier. The two black grape varieties are pressed slowly and gently to draw out the distinctive colours and flavours. The result is a delicate, dry Rosé with a balanced floral character and complex notes of white peach and red berries.', 'Exton Park.png', 30),
('Sparkling Wine', 24, 2020, 'French Bloom Le Blanc', 542, 'A blend of delacoholized organic French Chardonnay wine, French Bloom Le Blanc opens with a minerality with accents of pear, the inimitable signature of the house. Between acidity and depth, French Bloom Le Blanc reveals dazzling floral bursts in the heart. Its tropical notes are followed by an evolution of granny smith apple, accords of white flowers and slightly spicy citrus fruits with a sparkling freshness.', 'French Bloom.png', 30),
('Sparkling Wine', 25, 2002, 'MOET AND CHANDON BRUT ROSE IMPERIAL NON VINTAGE', 1015, 'On the nose, this vivid pink champagne displays a fruity bouquet of red berries and cherries. On the palate, an initial sweetness of berries lends itself to a freshness of fruits. The finish is long with more red fruit flavour and hints of pink grapefruit. A very vinous rosé with a fruit-forward style.', 'Moet.png', 30),
('Red Wine', 26, 2006, 'Château Lafite-Rothschild', 2012, 'Still something of an unsung hero. The 2006 Lafite-Rothschild was one of those classically proportioned vintages from this Château; it exuded refinement but was possibly outgunned by richer, bolder more powerful examples when tasted prior to its en primeur release in spring 2007. If the prerequisites for a great wine are harmony, refinement, purity, proportion and length of flavour with sufficient structure to reward long-term ageing, then 2006 Chateau Lafite-Rothschild is surely one. A classic in the truest meaning of the word. Opaque in the glass, Lafite shows beautiful scents of blackcurrant, tobacco leaf and minerals. The palate is bold and expansive, with a taut tannic structure that is veiled by appealing pure, dusky black fruit. A classical, majestic Lafite with fine potential. Robert Parker Score: 97 points', 'Lafite-Rothschild.png', 30),
('Red Wine', 27, 2018, 'Caymus Special Selection Cabernet Sauvignon ', 2018, 'Lush and polished, with waves of cassis and blackberry compote pouring through, underscored by chocolate, espresso crema and roasted vanilla bean. Maintains a lush, velvety feel through the lengthy finish, where flashes of sweet tobacco and warm earth peek through.', 'Caymus Special.png', 30);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`basket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `basket_items`
--
ALTER TABLE `basket_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basket_id` (`basket_id`);

--
-- Index pour la table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`email`);

--
-- Index pour la table `Wines`
--
ALTER TABLE `Wines`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `baskets`
--
ALTER TABLE `baskets`
  MODIFY `basket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `basket_items`
--
ALTER TABLE `basket_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Wines`
--
ALTER TABLE `Wines`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `baskets`
--
ALTER TABLE `baskets`
  ADD CONSTRAINT `baskets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `basket_items`
--
ALTER TABLE `basket_items`
  ADD CONSTRAINT `basket_items_ibfk_1` FOREIGN KEY (`basket_id`) REFERENCES `baskets` (`basket_id`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

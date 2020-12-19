CREATE DATABASE IF NOT EXISTS `enoteca`;
USE enoteca;

DROP USER IF EXISTS 'gestore_enoteca';
CREATE USER 'gestore_enoteca' IDENTIFIED BY 'Password-Molto-Sicura';
GRANT ALL PRIVILEGES ON enoteca.* TO 'gestore_enoteca';

DROP TABLE IF EXISTS wine_winegrape;
DROP TABLE IF EXISTS wine;
DROP TABLE IF EXISTS winefamily;
DROP TABLE IF EXISTS winegrape;
DROP TABLE IF EXISTS winery;
DROP TABLE IF EXISTS winedenom;
DROP TABLE IF EXISTS winetype;
DROP TABLE IF EXISTS winecolor;
DROP TABLE IF EXISTS region;
DROP TABLE IF EXISTS country;

CREATE TABLE winery (
	wineryId INT NOT NULL AUTO_INCREMENT,
	winery VARCHAR(100) NOT NULL,
	address VARCHAR(100),
	telephone VARCHAR(30),
	PRIMARY KEY(wineryId)
);

CREATE TABLE winecolor (
	winecolorId INT NOT NULL AUTO_INCREMENT,
	winecolor VARCHAR(10) NOT NULL,
	PRIMARY KEY(winecolorId)
);

CREATE TABLE winetype (
	winetypeId INT NOT NULL AUTO_INCREMENT,
	winetype VARCHAR(30) NOT NULL,
	PRIMARY KEY(winetypeId)
);

CREATE TABLE winedenom (
	winedenomId INT NOT NULL AUTO_INCREMENT,
	winedenom VARCHAR(10) NOT NULL,
	PRIMARY KEY(winedenomId)
);

CREATE TABLE country (
	countryId INT NOT NULL AUTO_INCREMENT,
	country VARCHAR(30) NOT NULL,
	PRIMARY KEY(countryId)
);

CREATE TABLE region (
	regionId INT NOT NULL AUTO_INCREMENT,
	region VARCHAR(30) NOT NULL,
	countryId INT NOT NULL,
	PRIMARY KEY(regionId),
	FOREIGN KEY(countryId) REFERENCES country(countryId) ON DELETE CASCADE
);

CREATE TABLE winefamily (
	winefamilyId INT NOT NULL AUTO_INCREMENT,
	winefamily VARCHAR(50) NOT NULL,
	winecolorId INT NOT NULL,
	winetypeId INT NOT NULL,
	winedenomId INT NOT NULL,
	regionId INT NOT NULL,
	PRIMARY KEY(winefamilyId),
	FOREIGN KEY(winecolorId) REFERENCES winecolor(winecolorId) ON DELETE CASCADE,
	FOREIGN KEY(winetypeId) REFERENCES winetype(winetypeId) ON DELETE CASCADE,
	FOREIGN KEY(winedenomId) REFERENCES winedenom(winedenomId) ON DELETE CASCADE,
	FOREIGN KEY(regionId) REFERENCES region(regionId) ON DELETE CASCADE
);

CREATE TABLE winegrape (
	winegrapeId INT NOT NULL AUTO_INCREMENT,
	winegrape VARCHAR(30) NOT NULL,
	PRIMARY KEY(winegrapeId)
);

CREATE TABLE wine (
	wine VARCHAR(100) NOT NULL,
	vintage INT UNSIGNED NOT NULL,
	wineryId INT NOT NULL,
	winefamilyId INT NOT NULL,
	availability INT NOT NULL,
	price INT UNSIGNED NOT NULL,
	PRIMARY KEY(wine, vintage),
	FOREIGN KEY(wineryId) REFERENCES winery(wineryId) ON DELETE CASCADE,
	FOREIGN KEY(winefamilyId) REFERENCES winefamily(winefamilyId) ON DELETE CASCADE
);

CREATE TABLE wine_winegrape (
	winegrapeId INT NOT NULL,
	wine VARCHAR(100) NOT NULL,
	vintage INT UNSIGNED NOT NULL,
	percentage INT UNSIGNED NOT NULL,
	FOREIGN KEY(wine, vintage) REFERENCES wine(wine, vintage) ON DELETE CASCADE,
	FOREIGN KEY(winegrapeId) REFERENCES winegrape(winegrapeId) ON DELETE CASCADE
);

USE enoteca;
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1350, 'Alicante');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (90, 'Aglianico');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (15, 'Sangiovese');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (265, 'Sagrantino');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (9, 'Merlot');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (229, 'Piedirosso');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (11, 'Nebbiolo');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (13, 'Pinot Noir');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1, 'Shiraz/Syrah');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (29, 'Barbera');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (78, 'Lagrein');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2969, 'Carignan (Carinena)');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (3, 'Cabernet Franc');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (56, 'Montepulciano');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (201, 'Zibibbo');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2683, 'glera');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (34, 'Pinot Blanc');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (96, 'Fiano');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (12, 'Pinot Gris');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (16, 'Sauvignon Blanc');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (180, 'Grecanico');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (4, 'Chardonnay');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2835, 'Sauvignon');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2822, 'Ribolla');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (95, 'Falanghina');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (14, 'Riesling');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (10, 'Muscat Blanc');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2610, 'biancolella');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (845, 'Ginestra');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1161, 'Pepella');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (215, 'Greco');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (6, 'Gewurztraminer');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (293, 'Friulano');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (99, 'Grillo');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2727, 'malvasia bianca');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (31, 'Ribolla Gialla');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (365, 'Roscetto');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1611, 'Trebbiano di Lugana');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1458, 'Greco di Tufo');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (1535, 'Müller-Thurgau');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (165, 'Verdicchio');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2861, 'Trebbiano (Ugni Blanc)');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (288, 'Carricante');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2770, 'moscato reale');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (111, 'Vermentino');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (52, 'Grechetto');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (73, 'Cortese');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (97, 'Garganega');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (473, 'Gaglioppo');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (427, 'Uva di Troia');
INSERT INTO winegrape (winegrapeId, winegrape) VALUES (2, 'Cabernet Sauvignon');
INSERT INTO winecolor (winecolorId, winecolor) VALUES (1, 'Rosso');
INSERT INTO winecolor (winecolorId, winecolor) VALUES (2, 'Bianco');
INSERT INTO winecolor (winecolorId, winecolor) VALUES (3, 'Rosato');
INSERT INTO winetype (winetypeId, winetype) VALUES (2, 'Fermo');
INSERT INTO winetype (winetypeId, winetype) VALUES (4, 'Spumante Metodo Charmat');
INSERT INTO winetype (winetypeId, winetype) VALUES (3, 'Spumante Metodo Classico');
INSERT INTO winetype (winetypeId, winetype) VALUES (6, 'Liquoroso');
INSERT INTO winetype (winetypeId, winetype) VALUES (1, 'Passito');
INSERT INTO winetype (winetypeId, winetype) VALUES (5, 'Frizzante');
INSERT INTO winedenom (winedenomId, winedenom) VALUES (1, 'DOCG');
INSERT INTO winedenom (winedenomId, winedenom) VALUES (2, 'DOC');
INSERT INTO winedenom (winedenomId, winedenom) VALUES (3, 'IGT');
INSERT INTO winedenom (winedenomId, winedenom) VALUES (4, '');
INSERT INTO country (countryId, country) VALUES (1, 'Italia');
INSERT INTO region (regionId, region, countryId) VALUES (15, 'Toscana', 1);
INSERT INTO region (regionId, region, countryId) VALUES (1, 'Campania', 1);
INSERT INTO region (regionId, region, countryId) VALUES (19, 'Umbria', 1);
INSERT INTO region (regionId, region, countryId) VALUES (13, 'Piemonte', 1);
INSERT INTO region (regionId, region, countryId) VALUES (16, 'Trentino e Alto Adige', 1);
INSERT INTO region (regionId, region, countryId) VALUES (8, 'Friuli Venezia Giulia', 1);
INSERT INTO region (regionId, region, countryId) VALUES (2, 'Basilicata', 1);
INSERT INTO region (regionId, region, countryId) VALUES (3, 'Lazio', 1);
INSERT INTO region (regionId, region, countryId) VALUES (18, 'Sardegna', 1);
INSERT INTO region (regionId, region, countryId) VALUES (14, 'Molise', 1);
INSERT INTO region (regionId, region, countryId) VALUES (17, 'Sicilia', 1);
INSERT INTO region (regionId, region, countryId) VALUES (12, 'Veneto', 1);
INSERT INTO region (regionId, region, countryId) VALUES (5, 'Calabria', 1);
INSERT INTO region (regionId, region, countryId) VALUES (7, 'Lombardia', 1);
INSERT INTO region (regionId, region, countryId) VALUES (10, 'Marche', 1);
INSERT INTO region (regionId, region, countryId) VALUES (4, 'Abruzzo', 1);
INSERT INTO region (regionId, region, countryId) VALUES (11, 'Puglia', 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (297, 'Morellino di Scansano', 1, 2, 1, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1189, 'Irpinia', 1, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (837, 'Montefalco', 1, 2, 2, 19);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (298, 'Chianti Classico', 1, 2, 1, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (267, 'Ischia', 1, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (787, 'Nebbiolo dAlba', 1, 2, 2, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1164, 'Alto Adige', 1, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1413, 'Venezia Giulia', 1, 2, 3, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (5, 'Aglianico del Vulture Superiore', 1, 2, 1, 2);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1197, 'Lazio', 1, 2, 3, 3);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1843, 'Campania', 1, 2, 3, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (308, 'Brunello di Montalcino', 1, 2, 1, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (766, 'Barbera dAlba', 1, 2, 2, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3929, 'Monferrato', 1, 2, 2, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (163, 'Alto Adige', 1, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4199, 'Barbera dAlba', 1, 2, 2, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (229, 'Barolo', 1, 2, 1, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4945, 'Isola dei Nuraghi', 1, 2, 3, 18);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (782, 'Langhe', 1, 2, 2, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (9, 'Taurasi', 1, 2, 1, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1298, 'Costa Toscana', 1, 2, 3, 19);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1348, 'Molise', 1, 2, 2, 14);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3167, 'Paestum', 1, 2, 3, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (622, 'Terre Siciliane', 2, 2, 3, 17);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1117, 'Prosecco', 2, 4, 2, 12);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (121, 'Fiano di Avellino', 2, 2, 1, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (573, 'Venezia Giulia', 2, 2, 3, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3965, 'Toscana', 2, 2, 3, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (522, 'Sicilia', 2, 2, 2, 17);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (552, 'Val di Neto', 2, 2, 3, 5);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (287, 'Collio', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (82, 'Franciacorta', 2, 3, 1, 7);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1421, 'Irpinia', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1538, 'Irpinia', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4273, 'Trentino', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (8127, 'Paestum', 2, 2, 3, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1302, 'Trento', 2, 3, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (119, 'Falanghina del Sannio', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2561, 'Costa dAmalfi Furore', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1282, 'Costa dAmalfi', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2564, 'Costa dAmalfi Tramonti', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (142, 'Greco di Tufo', 2, 2, 1, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3043, 'Lazio', 2, 2, 3, 3);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3104, 'Friuli Grave', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3106, 'Friuli Grave', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1518, 'Collio', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1304, 'Collio', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1261, 'Collio', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1427, 'Marsala', 2, 6, 2, 17);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1188, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1179, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (122, 'Rosazzo', 2, 2, 1, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (650, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2124, 'Lazio', 2, 2, 3, 3);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (75, 'Trento', 2, 3, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1975, 'Paestum', 2, 2, 3, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (172, 'Lugana', 2, 2, 2, 7);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (368, 'Cilento', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (652, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (644, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (42, 'Ischia', 2, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1225, 'Verdicchio dei Castelli di Jesi', 2, 2, 2, 10);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (327, 'Trebbiano dAbruzzo', 2, 2, 2, 4);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1888, 'Etna', 2, 2, 2, 17);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3541, 'Friuli Colli Orientali', 2, 2, 2, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (332, 'Vin Santo del Chianti Classico', 2, 1, 2, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4179, 'Asti', 2, 2, 1, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2635, 'Basilicata', 2, 2, 3, 2);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1731, 'Alta Langa', 2, 3, 1, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (203, 'Asti', 2, 1, 1, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3964, 'Molise', 2, 1, 2, 14);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1506, 'Venezia Giulia', 2, 2, 3, 8);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1664, 'Molise', 2, 2, 2, 14);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1511, 'Vigneti delle Dolomiti', 2, 2, 3, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (411, 'Vermentino di Sardegna', 2, 2, 2, 18);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (634, 'Umbria', 2, 2, 3, 19);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (91, 'Gavi', 2, 2, 1, 13);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1378, 'Franciacorta', 2, 3, 1, 7);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1411, 'Soave', 2, 2, 2, 12);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (359, 'Pantelleria', 2, 1, 2, 17);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (645, 'Alto Adige', 2, 2, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4223, 'Colli di Salerno', 3, 5, 3, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (4937, 'Orcia', 3, 2, 2, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2629, 'Basilicata', 3, 2, 3, 2);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (1226, 'Irpinia', 3, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (718, 'Val di Neto', 3, 2, 3, 5);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (656, 'Irpinia', 3, 2, 2, 1);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (3575, 'Castel del Monte', 3, 2, 2, 11);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (677, 'Bolgheri', 3, 2, 2, 15);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (2251, 'Alto Adige', 3, 3, 2, 16);
INSERT INTO winefamily (winefamilyId, winefamily, winecolorId, winetypeId, winedenomId, regionId) VALUES (38821, 'Trento DOC Rosè Nature', 3, 3, 4, 16);
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (7893, 'Poggio Argentiera', '2 Strada Banditella, Grosseto 58100, Tuscany', '+39 (0)5 6440 5099');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (546, 'Mastroberardino', 'Via Manfredi, 75/81', '0825 614111');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10085, 'Arnaldo Caprai', 'Località Torre', '0742 378802');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9986, 'Lamole Di Lamole', 'Via Citille, 43, Greve in Chianti, Firenze', '+39 (0)5 7773 8186');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4990, 'Casa DAmbra', 'Via Mario DAmbra, 16 - Frazione Panza', '081 907210');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (686, 'Marchesi Di Barolo', 'Via Roma, 1', '0173 564491');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (7067, 'Kellerei St. Michael-Eppan', 'Via Circonvallazione, 17/19', '0471 664466');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5969, 'Azienda Agricola Alturis', '21 via Strada Braide, Cividale del Friuli 33043, Friuli-Venezia Giulia', '+39 (0)4 3271 6344');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10112, 'Basilisco', 'Via delle Cantine, 20', '0972 771033');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10070, 'Falesco', 'Località San Pietro sn - 05020 Montecchio', '+39 (0)7 449 556');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5765, 'Azienda Agricola Montevetrano', 'Via Montevetrano, 3', '089 882285');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (623, 'Ruffino', 'Piazzale Ruffino, 1', '055 83605');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6797, 'Marchesi Antinori', 'Via Cassia per Siena, 133 - Bargino', '055 23595');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6754, 'Luciano Sandrone', 'Via Pugnane, 4', '0173 560023');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6994, 'Paolo Saracco', 'Via Circonvallazione, 6', '0141 855113');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10081, 'Elena Walch', 'Via Andrea Hofer, 1', '0471 860172');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9978, 'Silvano Bolmida', 'loc. Bussia 30 - 12065 MONFORTE DALBA (CN)', '+39 (0)1 7378 9877');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6172, 'Azienda Agricola Rivetti Massimo', 'Via Rivetti, 22', '0173 67505');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (58856, 'Capichera Azienda Vitivinicola', 'Strada Arzachena-SantAntonio, km 4 - Località Spriddha', '0789 80800');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (643, 'Feudi Di San Gregorio', 'Località Cerza Grossa', '0825 986683');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (59520, 'Tenute Lunelli - Tenuta Margon', 'null', 'null');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10017, 'Di Majo Norante', 'Contrada  Ramitello, 4', '0875 57208');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10195, 'Viticoltori De Concilis', 'Località Querce, 1', '0974 831090');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (770, 'Badia A Coltibuono', 'Località Badia a Coltibuono', '0577 746110');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (2500, 'Ampelos', 'null', 'null');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10236, 'Cantine Pellegrino 1880', 'null', 'null');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10947, 'Villa Marcello', 'null', 'null');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4584, 'Joaquin Wines', 'null', '+39 (0)825 188 2550');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5930, 'Di Lenardo Vineyards', 'Piazza Battisti, 1 - Località Ontagnano', '0432 928633');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6062, 'Bindella Societa Agricola', 'Via delle Tre Berte, 10/A', '0578 767777');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (666, 'Mandrarossa', '115 Strada Statale, Menfi, Sicily 92013', '+39 (0)9 257 7111');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4583, 'Azienda Agricola Villa Diamante', 'Via Toppole 16, 83130 Avellino (AV)', '+39 (0)8 253 0777');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10080, 'Librandi', 'SS 106 - Contrada San Gennaro', '0962 31518');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4585, 'Tenuta Sarno 1860', 'Contrada Serroni, 4/B', '339 7265669');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (978, 'Pighin', 'Viale Grado, 11/1 - Frazione Risano', '0432 675444');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (58720, 'Azienda Agricola Ferghettina', 'Via Saline, 11', '030 7451212');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10047, 'Quintodecimo', 'Via San Leonardo, 27', '0825 449321');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4218, 'Cantina Di Prisco', 'C.da Rotole, 83040 Fontanarosa (AV)', '+39 (0)8 2547 5738');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (7951, 'Cantina Pelz', 'Localita Cavade, 38034 Cembra (TN), Trentino-Alto Adige', '+39 (0)4 6168 3051');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9366, 'Tenuta Mainardi', 'Località Mainardi - 84020 Aquara (Salerno)', '+39 (0)828 189 7465');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (11204, 'Mas Dei Chini', 'Via Bassano, 3 - Frazione Martignano', '0461 821513');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4975, 'Az. Ag. Nifo Sarrapochiello', 'Via Piana, 62', '0824 876450');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4931, 'Terredora', 'Via Serra', '0825 968215');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10115, 'Marisa Cuomo', 'Via G.B. Lama, 16/18', '089 830348');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (1653, 'A.AGRICOLA SAN FRANCESCO S.R.L.', 'Cascine Fornaci, Cerro al Lambro, Lombardy, 20070', '+86 138 5320 5943');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4189, 'Cantine dellAngelo', 'Via Santa Lucia, 32', '0825 998073 ');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9244, 'Casale del Giglio', 'Strada Cisterna – Nettuno, Km 13 – 04100 Le Ferriere (LT)', '06 92902530');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5914, 'Casa Vinicola Antonutti', 'Via Luigi DAntoni, 21', '0432 662201');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5859, 'Conti Formentini', 'Via Oslavia 5, 34070 San Floriano del Collio (GO)', '+39 (0)4 8188 4131');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6899, 'Cantine Intorcia', 'Via Mazara, 10, 91025 Marsala (TP)', '+39 (0)9 2399 9133');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10082, 'Tramin', 'Strada del Vino 144, 39040 Termeno(BZ)', '0471 096633');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4816, 'Livio Felluga', 'Via Risorgimento, 1 - Frazione Brazzano', '0481 60203');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10113, 'Ferrari', 'Via del Ponte di Ravina, 15', '0461 972311');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (603, 'Cà Maiol', 'Via Colli Storici, 119', '030 9910006');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10005, 'Luigi Maffini', 'Via Serri, 34/D', '0828 1997568');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10088, 'Bellavista', 'Via Bellavista, 5', '030 7762000');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (953, 'Antonio Caggiano', 'Contrada Sala', '0827 74723');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (613, 'Planeta', 'Contrada Dispensa', '091 327965');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10207, 'Ornellaia', 'Via Bolgherese, 191 - Bolgheri', '0565 71811');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5151, 'Accadia', 'Contrada Ammorto 19, Localita Castellaro, 60048 Serra San Quirico (AN), Marche', '+39 (0)7 318 5172');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10089, 'Masciarelli', 'Via Gamberale, 2', '0871 85241');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9996, 'Benanti', 'Via Giuseppe Garibaldi, 361, 95029 Viagrande CT', '+39 (0)9 5789 3438');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10041, 'Barone Ricasoli', 'Località Madonna a Brolio', '0577 7301');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (3792, 'Weingut Ebner', 'Frazione Campodazzo, 18', '0471 353386');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (608, 'Fontanafredda', 'Via Alba, 15', '0173 626111');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (5992, 'Josko Gravner', '9 Oslavia, Gorizia 34170, Friuli-Venezia Giulia', '+39 (0)4 813 0882');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10105, 'Tenuta San Leonardo', 'Loc. San Leonardo 1, 38060 Avio TN', '0464 689004');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10110, 'Argiolas', 'Via Roma, 56-58', '070 740606');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (997, 'Villa Sparina', 'Frazione Monterotondo, 56', '0143 607801');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (4580, 'Azienda Vinicola Pietracupa', 'Via Vadiaperti 17, Montefredane 83030 (AV)', '+39 (0) 825 37795');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (7254, 'I Campi', '29A Via Sarmazza, Monteforte dAlpone 37032, Verona', '+39 (0)4 5617 5915');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (672, 'Donnafugata', 'Via Sebastiano Lipari, 18', '0923 724200');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (11082, 'Lenza', 'null', 'null');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (6015, 'Tenuta Sanoner', 'Loc. SantAnna, Bagno Vignoni, 53027 San Quirico d Orcia, Tuscany', '+39 (0)577 169 8707');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (9374, 'Cantine del Notaio', 'Via Roma, 159', '0972 723689');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (911, 'Ognissole', 'SP 143, km 3 - Contrada Cefalicchio', '0825 986686');
INSERT INTO winery (`wineryId`, `winery`, `address`, `telephone`) VALUES (10201, 'Kettmeir', 'Via Cantine, 4', '0471 963135');
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('capatosta', 2016, 7893, 297, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('irpinia aglianico doc', 2018, 546, 1189, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('montefalco rosso doc', 2018, 10085, 837, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('chianti classico docg', 2017, 9986, 298, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('chianti classico docg', 2015, 9986, 298, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('pere palummo ischia', 2019, 4990, 267, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('michet nebbiolo dalba', 2018, 686, 787, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige pinot nero doc "sanct valentin"', 2017, 7067, 1164, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alturis pinot nero venezia giulia igt', 2019, 5969, 1413, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('aglianico del vulture superiore docg', 2013, 10112, 5, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('lazio syrah igp "tellus"', 2018, 10070, 1197, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('montevetrano di silvia imparato core campania igt', 2017, 5765, 1843, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('brunello di montalcino docg "tenuta greppone mazzi"', 2015, 623, 308, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('badia a passignano', 2017, 6797, 298, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('barbera dalba', 2018, 6754, 766, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('pinot nero', 2018, 6994, 3929, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('castel ringberg lagrein alto adige riserva', 2019, 10081, 163, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('castel ringberg lagrein alto adige riserva', 2016, 10081, 163, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('conca del grillo barbera dalba superiore', 2017, 9978, 4199, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('massimo rivetti froi barbera dalba superiore', 2017, 6172, 4199, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('le vigne', 2016, 6754, 229, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('le vigne', 2010, 6754, 229, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('capichera assaje carignano isola dei nuraghi igt', 2017, 58856, 4945, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('capichera assaje carignano isola dei nuraghi igt', 2016, 58856, 4945, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('massimo rivetti avene langhe nebbiolo', 2016, 6172, 782, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('feudistudi taurasi docg', 2015, 643, 9, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('la vigna dei mille anni ischia', 2016, 4990, 267, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('costa toscana cabernet franc igt "auritea"  - tenuta podernovo', 2015, 59520, 1298, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('molise rosso riserva doc "don luigi"', 2015, 10017, 1348, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('aglianico naima paestum igt', 2011, 10195, 3167, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('chianti classico docg "rs"', 2017, 770, 298, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('molise aglianico riserva doc "contado"', 2015, 10017, 1348, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('la pievaccia brunello di montalcino docg', 2009, 2500, 308, 4, 40);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('terre siciliane bianco igt "gibelè"', 2019, 10236, 622, 30, 25);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('prosecco treviso spumante brut millesimato doc', 2018, 10947, 1117, 45, 78);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('fiano di avellino docg "vino della stella"', 2017, 4584, 121, 10, 17);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('venezia giulia pinot grigio ramato igt "gossip"', 2018, 5930, 573, 10, 25);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('toscana sauvignon blanc igt "gemella"', 2018, 6062, 3965, 1, 14);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sicilia sauvignon blanc doc "urra di mare"', 2017, 666, 522, 1, 12);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sicilia grecanico dorato doc "costadune"', 2017, 666, 522, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('villa diamante vigna della congregazione', 2017, 4583, 121, 1, 30);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('val di neto bianco igt "critone"', 2017, 10080, 552, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('fiano di avellino docg', 2017, 4585, 121, 1, 14);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('ribolla gialla collio', 2018, 978, 287, 1, 11);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('franciacorta brut docg', 2015, 58720, 82, 1, 27);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('irpinia falanghina doc "via del campo"', 2017, 10047, 1421, 1, 37);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('di prisco rotole irpinia fiano', 2018, 4218, 1538, 1, 11);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('riesling trentino', 2016, 7951, 4273, 1, 14);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sintonie paestum bianco igt', 2017, 9366, 8127, 1, 12);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('trento riserva brut doc "inkino"', 2010, 11204, 1302, 1, 40);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('falanghina del sannio taburno', 2016, 4975, 119, 1, 11);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('taurasi', 2018, 4931, 121, 1, 13);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('fiano', 2017, 4583, 121, 1, 30);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('furore bianco costa damalfi', 2018, 10115, 2561, 1, 18);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('per eva bianco costa d amalfi', 2018, 1653, 1282, 1, 25);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('tramonti costa damalfi bianco', 2018, 1653, 2564, 1, 14);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('di paolo', 2018, 4931, 142, 1, 13);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('miniere', 2016, 4189, 142, 1, 14);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sauvignon lazio igt', 2018, 9244, 3043, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('traminer aromatico friuli grave', 2018, 5914, 3104, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('chardonnay friuli grave', 2017, 5914, 3106, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('pinot grigio collio', 2018, 978, 1518, 1, 11);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('caligo sauvignon del collio', 2017, 5859, 1304, 1, 13);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('friulano collio', 2018, 978, 1261, 1, 11);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('marsala vergine secco doc "vintage"', 2004, 6899, 1427, 1, 31);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige sauvignon "the wine collection"', 2016, 7067, 1188, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('cantina termeno - kellerei tramin selections stoan white alto adige', 2018, 10082, 1179, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('abbazia di rosazzo', 2017, 4816, 122, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige gewürztraminer "nussbaumer"', 2018, 10082, 650, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('famiglia cotarella falesco ferentano lazio igt', 2016, 10070, 2124, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('trento doc "giulio ferrari riserva del fondatore"', 2008, 10113, 75, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('paestum fiano igt "donnaluna"', 2019, 10195, 1975, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('lugana dop bio "molin"', 2019, 603, 172, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige gewürztraminer doc "sanct valentin"', 2018, 7067, 650, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige gewürztraminer doc "sanct valentin"', 2019, 7067, 650, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('cilento fiano igt "kratos"', 2019, 10005, 368, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('lugana dop "prestige"', 2019, 603, 172, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige riesling doc "montiggl"', 2019, 7067, 652, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige sauvignon doc "lahn"', 2019, 7067, 1188, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('franciacorta brut docg "teatro alla scala"', 2015, 10088, 82, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('cilento fiano doc "pietraincatenata"', 2018, 10005, 368, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('fiano di avellino docg "pietracalda"', 2019, 643, 121, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('fiano di avellino "béchar"', 2019, 953, 121, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('falanghina del sannio doc "serrocielo"', 2019, 643, 119, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('greco di tufo docg "cutizzi"', 2019, 643, 142, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('greco di tufo docg "devon"', 2019, 953, 142, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sicilia grecanico doc "alastro"', 2019, 613, 522, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige gewürztraminer doc', 2019, 7067, 650, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige müller thurgau doc', 2019, 7067, 644, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('biancolella ischia', 2019, 4990, 42, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('poggio alle gazze dell'' toscana igt', 2018, 10207, 3965, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('angelo conscio verdicchio dei castelli di jesi classico', 2017, 5151, 1225, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('frassitelli biancolella ischia', 2019, 4990, 42, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('morabianca falanghina irpinia', 2019, 546, 1421, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('gianni trebbiano d abruzzo', 2019, 10089, 327, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('etna bianco', 2019, 9996, 1888, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('illivio colli orientali del friuli bianco', 2018, 4816, 3541, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('vin santo del chianti classico doc "castello di brolio"', 2011, 10041, 332, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('moscato dasti docg', 2019, 6994, 4179, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('tenuta sauvignon sudtirol - alto adige', 2017, 3792, 1188, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('sophia basilicata bianco igt', 2018, 10112, 2635, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alta langa brut doc "vigna gatinera"', 2008, 608, 1731, 1, 25);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('trento riserva brut doc "inkino"', 2011, 11204, 1302, 1, 25);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('moscato dasti docg "zagara"', 2019, 686, 203, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('donnaluna cilento fiano', 2017, 10195, 368, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('molise moscato reale doc "apianae"', 2015, 10017, 3964, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('gravner anfora pinot grigio venezia giulia igt', 2012, 5992, 1506, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('gravner anfora pinot grigio venezia giulia igt', 2011, 5992, 1506, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('gravner anfora pinot grigio venezia giulia igt', 2010, 5992, 1506, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('molise falanghina doc "ramì"', 2019, 10017, 1664, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('vigneti delle dolomiti sauvignon blanc igt "vette di san leonardo"', 2019, 10105, 1511, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('vermentino di sardegna doc "merì"', 2019, 10110, 411, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('umbria bianco igt "cervaro della sala"', 2018, 6797, 634, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('gavi del comune di gavi docg', 2016, 997, 91, 1, 17);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('pietracupa greco di tufo docg', 2018, 4580, 142, 10, 20);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('franciacorta "riserva 33" pas dosé', 2012, 58720, 1378, 2, 39);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('campo vulcano soave classico', 2016, 7254, 1411, 1, 24);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('passito di pantelleria ben ryé', 2016, 672, 359, 4, 40);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('cantina termeno - kellerei tramin selections unterebner pinot grigio alto adige', 2017, 10082, 645, 10, 36);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('colli di salerno aglianico rosato frizzante igt "gabry"', 2018, 11082, 4223, 1, 12);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('aetos rose orcia', 2017, 6015, 4937, 1, 15);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('rosato basilicata igt', 2018, 9374, 2629, 1, 12);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('irpinia rosato doc "visione"', 2019, 643, 1226, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('val di neto rosato igt "terre lontane"', 2019, 10080, 718, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('irpinia rosato doc "lacrimarosa"', 2019, 546, 656, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('cefalicchio pontelama rosato castel del monte', 2019, 911, 3575, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('bolgheri rosato doc "scalabrone"  - tenuta guado al tasso', 2019, 6797, 677, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('alto adige spumante brut rosé metodo classico doc "athesis"', 2017, 10201, 2251, 1, 10);
INSERT INTO wine (`wine`, `vintage`, `wineryId`, `winefamilyId`, `availability`, `price`) VALUES ('inkino trento doc rosè nature', 2010, 11204, 38821, 1, 30);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1350, 'capatosta', 2016, 5);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'irpinia aglianico doc', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'montefalco rosso doc', 2018, 70);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (265, 'montefalco rosso doc', 2018, 15);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (9, 'montefalco rosso doc', 2018, 15);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'chianti classico docg', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'chianti classico docg', 2015, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (11, 'michet nebbiolo dalba', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'alto adige pinot nero doc "sanct valentin"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'alturis pinot nero venezia giulia igt', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'aglianico del vulture superiore docg', 2013, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1, 'lazio syrah igp "tellus"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'brunello di montalcino docg "tenuta greppone mazzi"', 2015, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'badia a passignano', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (29, 'barbera dalba', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'pinot nero', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (78, 'castel ringberg lagrein alto adige riserva', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (78, 'castel ringberg lagrein alto adige riserva', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (29, 'conca del grillo barbera dalba superiore', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (29, 'massimo rivetti froi barbera dalba superiore', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (11, 'le vigne', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (11, 'le vigne', 2010, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2969, 'capichera assaje carignano isola dei nuraghi igt', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2969, 'capichera assaje carignano isola dei nuraghi igt', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (229, 'la vigna dei mille anni ischia', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (3, 'costa toscana cabernet franc igt "auritea"  - tenuta podernovo', 2015, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (56, 'molise rosso riserva doc "don luigi"', 2015, 90);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'molise rosso riserva doc "don luigi"', 2015, 10);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'aglianico naima paestum igt', 2011, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (15, 'chianti classico docg "rs"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'molise aglianico riserva doc "contado"', 2015, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (201, 'terre siciliane bianco igt "gibelè"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2683, 'prosecco treviso spumante brut millesimato doc', 2018, 85);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (34, 'prosecco treviso spumante brut millesimato doc', 2018, 15);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'fiano di avellino docg "vino della stella"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (12, 'venezia giulia pinot grigio ramato igt "gossip"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'toscana sauvignon blanc igt "gemella"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'sicilia sauvignon blanc doc "urra di mare"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (180, 'sicilia grecanico dorato doc "costadune"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'val di neto bianco igt "critone"', 2017, 90);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2835, 'val di neto bianco igt "critone"', 2017, 10);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'fiano di avellino docg', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2822, 'ribolla gialla collio', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'franciacorta brut docg', 2015, 95);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'franciacorta brut docg', 2015, 5);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'irpinia falanghina doc "via del campo"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (14, 'riesling trentino', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'trento riserva brut doc "inkino"', 2010, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'falanghina del sannio taburno', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'taurasi', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'fiano', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'furore bianco costa damalfi', 2018, 60);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2610, 'furore bianco costa damalfi', 2018, 40);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2610, 'tramonti costa damalfi bianco', 2018, 40);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'tramonti costa damalfi bianco', 2018, 40);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1161, 'tramonti costa damalfi bianco', 2018, 20);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (215, 'di paolo', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'sauvignon lazio igt', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (6, 'traminer aromatico friuli grave', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'chardonnay friuli grave', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (12, 'pinot grigio collio', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (293, 'friulano collio', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (99, 'marsala vergine secco doc "vintage"', 2004, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2835, 'alto adige sauvignon "the wine collection"', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (6, 'alto adige gewürztraminer "nussbaumer"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'trento doc "giulio ferrari riserva del fondatore"', 2008, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'paestum fiano igt "donnaluna"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1611, 'lugana dop bio "molin"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (6, 'alto adige gewürztraminer doc "sanct valentin"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (6, 'alto adige gewürztraminer doc "sanct valentin"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'cilento fiano igt "kratos"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1611, 'lugana dop "prestige"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (14, 'alto adige riesling doc "montiggl"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2835, 'alto adige sauvignon doc "lahn"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'franciacorta brut docg "teatro alla scala"', 2015, 72);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'franciacorta brut docg "teatro alla scala"', 2015, 28);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'cilento fiano doc "pietraincatenata"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'fiano di avellino docg "pietracalda"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'fiano di avellino "béchar"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'falanghina del sannio doc "serrocielo"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (215, 'greco di tufo docg "cutizzi"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1458, 'greco di tufo docg "devon"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (180, 'sicilia grecanico doc "alastro"', 2019, 70);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (99, 'sicilia grecanico doc "alastro"', 2019, 15);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'sicilia grecanico doc "alastro"', 2019, 15);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (6, 'alto adige gewürztraminer doc', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1535, 'alto adige müller thurgau doc', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2610, 'biancolella ischia', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (165, 'angelo conscio verdicchio dei castelli di jesi classico', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2610, 'frassitelli biancolella ischia', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'morabianca falanghina irpinia', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (288, 'etna bianco', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (34, 'illivio colli orientali del friuli bianco', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2727, 'vin santo del chianti classico doc "castello di brolio"', 2011, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (10, 'moscato dasti docg', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'tenuta sauvignon sudtirol - alto adige', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'alta langa brut doc "vigna gatinera"', 2008, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'trento riserva brut doc "inkino"', 2011, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (10, 'moscato dasti docg "zagara"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'donnaluna cilento fiano', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2770, 'molise moscato reale doc "apianae"', 2015, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (12, 'gravner anfora pinot grigio venezia giulia igt', 2012, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (12, 'gravner anfora pinot grigio venezia giulia igt', 2011, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (12, 'gravner anfora pinot grigio venezia giulia igt', 2010, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (95, 'molise falanghina doc "ramì"', 2019, 90);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (96, 'molise falanghina doc "ramì"', 2019, 10);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (16, 'vigneti delle dolomiti sauvignon blanc igt "vette di san leonardo"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (111, 'vermentino di sardegna doc "merì"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'umbria bianco igt "cervaro della sala"', 2018, 90);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (52, 'umbria bianco igt "cervaro della sala"', 2018, 10);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (73, 'gavi del comune di gavi docg', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (215, 'pietracupa greco di tufo docg', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (4, 'franciacorta "riserva 33" pas dosé', 2012, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (201, 'passito di pantelleria ben ryé', 2016, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'colli di salerno aglianico rosato frizzante igt "gabry"', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'rosato basilicata igt', 2018, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'irpinia rosato doc "visione"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (473, 'val di neto rosato igt "terre lontane"', 2019, 70);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (3, 'val di neto rosato igt "terre lontane"', 2019, 30);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (90, 'irpinia rosato doc "lacrimarosa"', 2019, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (2, 'bolgheri rosato doc "scalabrone"  - tenuta guado al tasso', 2019, 40);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (9, 'bolgheri rosato doc "scalabrone"  - tenuta guado al tasso', 2019, 30);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (1, 'bolgheri rosato doc "scalabrone"  - tenuta guado al tasso', 2019, 30);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'alto adige spumante brut rosé metodo classico doc "athesis"', 2017, 100);
INSERT INTO wine_winegrape (`winegrapeId`, `wine`, `vintage`, `percentage`) VALUES (13, 'inkino trento doc rosè nature', 2010, 100);




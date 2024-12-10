CREATE TABLE `Helyszín` (
  `ID` int PRIMARY KEY,
  `Ország` varchar(255),
  `ÖkológiaiRégió` varchar(255)
);

CREATE TABLE `Méret` (
  `ID` int PRIMARY KEY,
  `Hossz` int,
  `Magasság` int
);


CREATE TABLE `Terület` (
  `ID` int PRIMARY KEY,
  `Helyszín_ID` int,
  `Típus` varchar(255),
  `VédelmiSzint` varchar(255),
  FOREIGN KEY (`Helyszín_ID`) REFERENCES `Helyszín` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `ÁllatFajok` (
  `ID` int PRIMARY KEY,
  `KözönségesNév` varchar(255),
  `TudományosNév` varchar(255),
  `Állapot` varchar(255),
  `Osztály` varchar(255),
  `Súly` int,
  `Méret_ID` int,
  `Táplálék` varchar(255),
  FOREIGN KEY (`Méret_ID`) REFERENCES `Méret` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE `Veszélyeztetett` (
  `ID` int PRIMARY KEY,
  `Állat_ID` int,
  `Terület_ID` int,
  FOREIGN KEY (`Állat_ID`) REFERENCES `ÁllatFajok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Terület_ID`) REFERENCES `Terület` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Vadvilág` (
  `ID` int PRIMARY KEY,
  `Név` varchar(255),
  `Leírás` text
);

CREATE TABLE `Állat_Vadállat` (
  `Állat_ID` int,
  `Vadvilág_ID` int,
  PRIMARY KEY (`Állat_ID`, `Vadvilág_ID`),
  FOREIGN KEY (`Állat_ID`) REFERENCES `ÁllatFajok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Vadvilág_ID`) REFERENCES `Vadvilág` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);



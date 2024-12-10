CREATE TABLE `Location` (
  `ID` int PRIMARY KEY,
  `Country` varchar(255),
  `EcologicalRegion` varchar(255)
);

CREATE TABLE `Size` (
  `ID` int PRIMARY KEY,
  `Length` int,
  `Height` int
);

CREATE TABLE `Area` (
  `ID` int PRIMARY KEY,
  `Location_ID` int,
  `Type` varchar(255),
  `ProtectionLevel` varchar(255),
  FOREIGN KEY (`Location_ID`) REFERENCES `Location` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `AnimalSpecies` (
  `ID` int PRIMARY KEY,
  `CommonName` varchar(255),
  `ScientificName` varchar(255),
  `Status` varchar(255),
  `Class` varchar(255),
  `Weight` int,
  `Size_ID` int,
  `Diet` varchar(255),
  FOREIGN KEY (`Size_ID`) REFERENCES `Size` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `Endangered` (
  `ID` int PRIMARY KEY,
  `Animal_ID` int,
  `Area_ID` int,
  FOREIGN KEY (`Animal_ID`) REFERENCES `AnimalSpecies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Area_ID`) REFERENCES `Area` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Wildlife` (
  `ID` int PRIMARY KEY,
  `Name` varchar(255),
  `Description` text
);

CREATE TABLE `Animal_Wildlife` (
  `Animal_ID` int,
  `Wildlife_ID` int,
  PRIMARY KEY (`Animal_ID`, `Wildlife_ID`),
  FOREIGN KEY (`Animal_ID`) REFERENCES `AnimalSpecies` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`Wildlife_ID`) REFERENCES `Wildlife` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
);

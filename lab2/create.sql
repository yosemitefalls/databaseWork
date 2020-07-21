

DROP SCHEMA Lab1 CASCADE; 
CREATE SCHEMA Lab1; 
-- Won't lose points if you include or don't include this


-- Create Tables for Lab1


CREATE TABLE Keepers (
	keeperID  INTEGER,
	name VARCHAR(30),
	hireDate DATE NOT NULL,
	keeperLevel CHAR(1),
	keeperSalary NUMERIC(7,2),
	PRIMARY KEY (keeperID)
);


CREATE TABLE Cages (
	cageID INTEGER,
	cageSector CHAR(1) NOT NULL,
	keeperID INTEGER,
	PRIMARY KEY (cageID),
	FOREIGN KEY (keeperID) REFERENCES Keepers
);


CREATE TABLE Species (
	speciesID INTEGER,
	speciesName VARCHAR(40) NOT NULL,
	genus VARCHAR(40),
	animalCount INTEGER,
	PRIMARY KEY (speciesID),
    UNIQUE (speciesName)
);


CREATE TABLE Animals (
	animalID INTEGER,	
	name VARCHAR(30) UNIQUE,
	speciesID INTEGER,
	animalAge INTEGER,
	cageID INTEGER,
	PRIMARY KEY (animalID),
	FOREIGN KEY (speciesID) REFERENCES Species,
	FOREIGN KEY (cageID) REFERENCES Cages,
    UNIQUE (name, speciesID)
);


CREATE TABLE Members (
	memberID INTEGER,
	name VARCHAR(30),
	address VARCHAR(40),
	memberStatus CHAR(1),
	joinDate DATE,
	expirationDate DATE,
	PRIMARY KEY (memberID),
    UNIQUE (name, address)
);

CREATE TABLE CageVisits (
	memberID INTEGER,
	cageID INTEGER,
	visitDate DATE,
	likedVisit boolean,
	PRIMARY KEY (memberID, cageID, visitDate),
	FOREIGN KEY (cageID) REFERENCES Cages,
	FOREIGN KEY (memberID) REFERENCES Members
);


CREATE TABLE Keepers (
keeperID INT,
PRIMARY KEY (keeperID),
name VARCHAR(30),
hireDate DATE,
keeperLevel CHAR(1),
keeperSalary NUMERIC(7,2)
);

CREATE TABLE Cages (
cageID INT,
PRIMARY KEY (cageID),
cageSector CHAR(1),
keeperID INT
);

CREATE TABLE Species (
speciesID INT,
PRIMARY KEY (speciesID),
speciesName VARCHAR(40),
genus VARCHAR(40),
animalCount INT
); 

CREATE TABLE Animals (
animalID INT,
PRIMARY KEY (animalID),
name VARCHAR(30),
speciesID INT,
animalAge INT,
cageID INT
);
CREATE TABLE Members (
memberID INT,
PRIMARY KEY (memberID),
name VARCHAR(30),
address VARCHAR(40),
memberStatus CHAR(1),
joinDate DATE,
experationDate DATE
);

CREATE TABLE CageVisits (
memberID INT,
cageID INT,
visitDate DATE,
PRIMARY KEY (memberID, cageID, visitDate),
FOREIGN KEY (memberID) REFERENCES Members,
FOREIGN KEY (cageID) REFERENCES Cages,
likedVisit BOOLEAN
);
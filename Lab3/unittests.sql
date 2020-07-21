INSERT INTO CageVisits VALUES(1001, 499, '2018-05-05',  false);

INSERT INTO CageVisits VALUES(1001, 499, '2018-05-05',  false);



UPDATE Species
SET animalCount = 1;

UPDATE Species
SET animalCount = -1;

UPDATE Members
SET expirationDate = '1/1/11',joinDate = '1/1/10';  

UPDATE Members
SET expirationDate = '1/1/10',joinDate = '1/1/11'; 

UPDATE Keepers
Set keeperLevel = NULL, keeperSalary = 1;

UPDATE Keepers
Set keeperLevel = NULL, keeperSalary = NULL;

ALTER TABLE Species	
ADD CONSTRAINT ani 
CHECK (Species.animalCount >= 0);

ALTER TABLE Members 
ADD CHECK (Members.expirationDate > Members.joinDate);

ALTER TABLE Keepers 
ADD CHECK ((keeperLevel IS NOT NULL AND keeperSalary IS NOT NULL) OR (keeperLevel IS NULL AND keeperSalary IS NULL) OR 
(keeperLevel IS NOT NULL AND keeperSalary IS NULL));



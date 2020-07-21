



BEGIN TRANSACTION;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO Animals (animalID, speciesID ,cageID, name, animalAge)
SELECT  animalID, speciesID, cageID, NULL, NULL
FROM AnimalChanges
WHERE AnimalChanges.animalID NOT IN
(SELECT animalID
FROM Animals);

UPDATE Animals
SET speciesID = AnimalChanges.speciesID,  cageID = AnimalChanges.cageID
FROM AnimalChanges
WHERE  AnimalChanges.animalID = Animals.animalID;
COMMIT;

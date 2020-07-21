CREATE VIEW viewComputedCount AS
Select Distinct a.speciesID, COUNT(*) AS computedAnimalCount
FROM Species s, Animals a
WHERE a.speciesID = s.speciesID
GROUP BY a.speciesID
HAVING COUNT(a.speciesID) > 3;

CREATE VIEW viewComputedCount AS
Select Distinct s.speciesID, COUNT(a.speciesID) AS computedAnimalCount
FROM Species s, Animals a
WHERE s.speciesID = a.speciesID 
GROUP BY s.speciesID
HAVING COUNT(s.speciesID) > 3;
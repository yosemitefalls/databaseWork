
-- query3
SELECT DISTINCT Keepers.keeperID, Keepers.keeperSalary, Keepers.name
FROM Keepers, Animals, Cages, Species
WHERE Species.speciesName = 'lion' AND Keepers.keeperID = Cages.keeperID AND
Cages.cageID = Animals.cageID AND Animals.SpeciesID = Species.SpeciesID
INTERSECT
SELECT DISTINCT Keepers.keeperID, Keepers.keeperSalary, Keepers.name
FROM Keepers, Animals, Cages, Species
WHERE Species.speciesName = 'tiger' AND Keepers.keeperID = Cages.keeperID AND
Cages.cageID = Animals.cageID AND Animals.SpeciesID = Species.SpeciesID
ORDER BY keeperSalary desc, name;
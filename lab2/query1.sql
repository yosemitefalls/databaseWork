-- query1
SELECT DISTINCT animalID
FROM  Animals, Cages
WHERE Cages.cageSector = 'N' AND Cages.cageID = Animals.cageID;

-- query2

SELECT name, address, cageID
FROM CageVisits, Members
WHERE CageVisits.likedVisit = true AND Members.memberID = CageVisits.memberID; 
--visited and liked 
--duplicate okay

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

--query4


	SELECT DISTINCT Members.memberID, Members.name
	from Members, Cages, Species, Animals, CageVisits
	Where Members.name like '%\th' AND Members.memberID = CageVisits.memberID AND CageVisits.cageID = Animals.cageID AND Animals.speciesID = 
	Species.speciesID AND Species.speciesName = 'lion';

--query5

	SELECT DISTINCT Animals.animalID, Cages.cageID, Animals.animalAge, Keepers.keeperID, Keepers.hireDate
	from Animals, Cages, Keepers, Species, CageVisits
	WHERE Species.speciesName like '%a%' AND Species.genus IS NOT NULL AND Keepers.hiredate BETWEEN '2019-01-02' AND '2019-12-30' AND CageVisits.likedVisit = false 
	AND Keepers.keeperID = Cages.keeperID AND Cages.cageID = Animals.cageID AND Animals.speciesID = species.speciesID AND CageVisits.cageID = Cages.cageID;
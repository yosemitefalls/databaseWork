
--query5

	SELECT DISTINCT Animals.animalID, Cages.cageID, Animals.animalAge, Keepers.keeperID, Keepers.hireDate
	from Animals, Cages, Keepers, Species, CageVisits
	WHERE Species.speciesName like '%a%' AND Species.genus IS NOT NULL AND Keepers.hiredate BETWEEN '2019-01-02' AND '2019-12-30' AND CageVisits.likedVisit = false 
	AND Keepers.keeperID = Cages.keeperID AND Cages.cageID = Animals.cageID AND Animals.speciesID = species.speciesID AND CageVisits.cageID = Cages.cageID;
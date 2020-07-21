
--query4


	SELECT DISTINCT Members.memberID, Members.name
	from Members, Cages, Species, Animals, CageVisits
	Where Members.name like '%\th' AND Members.memberID = CageVisits.memberID AND CageVisits.cageID = Animals.cageID AND Animals.speciesID = 
	Species.speciesID AND Species.speciesName = 'lion';
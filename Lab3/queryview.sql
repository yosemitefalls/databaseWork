

	
	
	
	SELECT v.speciesID, s.animalCount, v.computedAnimalCount, s.speciesName
	From viewComputedCount v, Species s
	Where v.computedAnimalCount <> s.animalCount AND s.speciesID = v.speciesID;
	
	--
	-- speciesid | animalcount | computedanimalcount | speciesname
	-- -----------+-------------+---------------------+-------------
    --   404 |           2 |                   3 | lion
    --  405 |           0 |                   4 | panther
    --  407 |           2 |                   4 | small cat
	--
	

	DELETE FROM Animals
	WHERE animalID = 10014;
	DELETE FROM Animals
	WHERE animalID = 10015;
	
	SELECT v.speciesID, s.animalCount, v.computedAnimalCount, s.speciesName
	From viewComputedCount v, Species s
	Where v.computedAnimalCount <> s.animalCount AND s.speciesID = v.speciesID;
	
	--
	--	speciesid | animalcount | computedanimalcount | speciesname
	-- -----------+-------------+---------------------+-------------
    --   401 |           4 |                   3 | tiger
    --   405 |           0 |                   4 | panther
    --  407 |           2 |                   4 | small cat

	
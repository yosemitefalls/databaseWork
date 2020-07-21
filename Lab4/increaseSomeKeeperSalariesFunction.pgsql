CREATE OR REPLACE FUNCTION increaseSomeKeepersSalariesFunction(maxIncreaseAmount INTEGER) 
RETURNS INTEGER AS $$

		DECLARE increases INTEGER;
		newSalary NUMERIC(7,2);
		changes INTEGER;
		increaseOfSalary INTEGER;
		
keepers CURSOR FOR SELECT K.keeperID, K.name, K.hireDate, K.keeperLevel, K.keeperSalary
					FROM Keepers K
					WHERE K.keeperLevel IN ('A', 'B', 'C')
					AND K.keeperSalary IS NOT NULL
					ORDER BY K.keeperLevel ASC, K.hireDate ASC;

kKeeperID INTEGER;
kName VARCHAR(30);
kHireDate DATE;
kKeeperLevel CHAR(1);
kSalary NUMERIC(7,2);								

BEGIN
	increases=0;
	
	changes=0;
	OPEN keepers;
	LOOP	
		FETCH keepers INTO kKeeperID, kName, kHireDate, kKeeperLevel, kSalary;
		EXIT WHEN NOT FOUND OR increases >= maxIncreaseAmount OR increases + 10 >= maxIncreaseAmount OR increases + 20 >= maxIncreaseAmount OR increases + 30 >= maxIncreaseAmount;
		CASE kKeeperLevel
				WHEN 'A' THEN
							increaseOfSalary =10;
							
							
				WHEN 'B' THEN
							increaseOfSalary =20;
							
							
				WHEN 'C' THEN
							increaseOfSalary =30;
							
				
							
			END CASE;
			
			
			newSalary=kSalary+increaseOfSalary;	
			increases =  increaseOfSalary + increases;
			UPDATE Keepers
			SET keeperSalary = newSalary
			WHERE keeperID = kKeeperID
			AND name = kName
			AND hireDate = kHireDate
			AND keeperLevel = kKeeperLevel
			AND keeperSalary = kSalary;
			
			
			
			
	END LOOP;
	CLOSE keepers;	
	RETURN increases;
		
END
$$ LANGUAGE plpgsql;
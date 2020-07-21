
-- query2

SELECT name, address, cageID
FROM CageVisits, Members
WHERE CageVisits.likedVisit = true AND Members.memberID = CageVisits.memberID; 
--visited and liked 
--duplicate okay
/* ---------------------------------------------------------
-- In each decade, how many schools produced MLB players? --
---------------------------------------------------------- */

SELECT 	
	FLOOR(yearID / 10) * 10 AS decade, COUNT( DISTINCT schoolID) AS num_schools
FROM 
	schools
GROUP BY 
	decade
ORDER BY 
	decade ASC;

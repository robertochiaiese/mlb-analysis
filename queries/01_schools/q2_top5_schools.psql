/* ---------------------------------------------------------
-------Top 5 schools that produced the most players---------
---------------------------------------------------------- */
USE MLBdb;

WITH players_produced AS (	SELECT 
								sd.name_full,
								s.schoolID,
								COUNT( DISTINCT s.playerID) AS players_by_school
							FROM schools s LEFT JOIN school_details sd ON s.schoolID = sd.schoolID
							GROUP BY s.schoolID, sd.name_full) 

SELECT 	*
FROM 	players_produced
WHERE name_full IS NOT NULL
ORDER BY players_by_school DESC
LIMIT 5;

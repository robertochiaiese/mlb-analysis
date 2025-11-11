/* ---------------------------------------------------------------------------
-- What team did each player play on for their starting and ending years? --
---------------------------------------------------------------------------- */

USE MLBdb;

SELECT t.nameGiven, t.playerID, t.first_year, s2.teamID, t.last_year, s3.teamID
FROM (
SELECT p.nameGiven, p.playerID, MIN(yearID) AS first_year, MAX(yearID)  AS last_year
FROM players p 
	RIGHT JOIN salaries s1 ON p.playerID = s1.playerID
GROUP BY p.nameGiven, p.playerID) t 
	LEFT JOIN  salaries s2 ON t.playerID = s2.playerID AND t.first_year = s2.yearID
    LEFT JOIN  salaries s3 ON t.playerID = s3.playerID AND t.last_year = s3.yearID;

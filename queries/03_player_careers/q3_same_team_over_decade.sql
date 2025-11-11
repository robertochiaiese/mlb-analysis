/* ---------------------------------------------------------
-- How many players started and ended on the same team and--
---------------also played for over a decade? --------------
---------------------------------------------------------- */

USE MLBdb;

WITH players_years AS (SELECT p.nameGiven, p.playerID, MIN(yearID) AS first_year, MAX(yearID)  AS last_year
					   FROM players p 
							RIGHT JOIN salaries s1 ON p.playerID = s1.playerID
					   GROUP BY p.nameGiven, p.playerID),
                       
	 track_players AS (SELECT py.nameGiven, py.playerID, py.first_year, s2.teamID AS first_team, py.last_year, s3.teamID AS last_team
					   FROM players_years py
							LEFT JOIN  salaries s2 ON py.playerID = s2.playerID AND py.first_year = s2.yearID
							LEFT JOIN  salaries s3 ON py.playerID = s3.playerID AND py.last_year = s3.yearID)

SELECT *
FROM track_players
WHERE first_team = last_team AND last_year - first_year >= 10;

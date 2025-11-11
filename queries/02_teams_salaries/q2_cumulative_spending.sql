/* ----------------------------------------------------------------------
-- For each team, what is the cumulative sum of spending over the years--
----------------------------------------------------------------------- */

USE MLBdb;

WITH total_salaries AS (SELECT  yearID, teamID, SUM(salary) AS  total_salary
						FROM 	salaries
						GROUP BY yearID, teamID)

SELECT  yearID, teamID, SUM(total_salary) OVER(PARTITION BY teamID ORDER BY yearID) AS  total_s_y
						FROM 	total_salaries
						GROUP BY yearID, teamID;

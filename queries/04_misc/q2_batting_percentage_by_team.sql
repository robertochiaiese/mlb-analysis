/* ---------------------------------------------------------
------- Show a summary table that shows for each team,------
-----what percent of players bat right, left and both. -----
---------------------------------------------------------- */

USE MLBdb;

WITH type_bats AS ( SELECT 	s.teamID,
					CASE WHEN p.bats = 'R' THEN 1 ELSE 0 END AS right_bats,
					CASE WHEN p.bats = 'L' THEN 1 ELSE 0 END AS left_bats,
					CASE WHEN p.bats = 'B' THEN 1 ELSE 0 END AS both_bats
			FROM players p INNER JOIN salaries s
						   ON p.playerID = s.playerID),
                           
	 total_baths AS (SELECT teamID,
					 SUM(right_bats) tot_right_bats, SUM(left_bats) AS tot_left_bats, SUM(both_bats) AS tot_both_bats
					FROM type_bats
					GROUP BY teamID)

SELECT teamID,
	   ROUND((tot_right_bats * 100)/( tot_right_bats + tot_left_bats + tot_both_bats),2) AS pr_right_bats, 
	   ROUND((tot_left_bats/(tot_left_bats + tot_right_bats + tot_both_bats) * 100),2) AS pr_left_bats, 
	   ROUND((tot_both_bats /(tot_both_bats + tot_left_bats + tot_right_bats) * 100),2) AS pr_both_bats
FROM total_baths
ORDER BY teamID;

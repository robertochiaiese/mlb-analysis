/* -----------------------------------------------------------------------
-- The first year that each team's cumulative spending surpassed 1 bill --
------------------------------------------------------------------------ */

USE MLBdb;

WITH total_salaries AS (SELECT  yearID, teamID, SUM(salary) AS  total_salary
                        FROM 	salaries
                        GROUP BY yearID, teamID),
                        
	 cumulative_spending AS(SELECT  yearID,
									                teamID,
								                	SUM(total_salary) OVER(PARTITION BY teamID ORDER BY yearID) AS  total_spent
            							FROM 	total_salaries
            							GROUP BY yearID, teamID)

SELECT yearID, teamID, total_spent
FROM ( 
      SELECT	  yearID,
				        teamID,
                total_spent,
				 row_number() OVER(PARTITION BY teamID ORDER BY total_spent) AS row_num
		FROM cumulative_spending
		WHERE total_spent > 1000000000 ) t
WHERE row_num = 1;

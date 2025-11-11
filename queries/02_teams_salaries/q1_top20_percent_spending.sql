/* -----------------------------------------------------------------------
----------Top 20% of teams in terms of average annual spending-----------
------------------------------------------------------------------------- */

USE MLbdb;

WITH total_salaries AS (SELECT  yearID, teamID, SUM(salary) AS total_salary
						FROM 	salaries
						GROUP BY yearID, teamID),
                        
	 avg_salaries 	AS (SELECT	
							teamID,
							ROUND (AVG( total_salary )/1000000, 1) AS average_salary_million
						FROM total_salaries
						GROUP BY teamID)

SELECT	*	
FROM ( SELECT teamID,
			  average_salary_million,
              NTILE(5) OVER(ORDER BY average_salary_million DESC) AS classification
		FROM avg_salaries
        ) t
WHERE classification = 1;

/* ---------------------------------------------------------
------ How have average height and weight at debut game-----
---------changed over the years, and what's the-------------
-------------decade-over-decade difference? ----------------
---------------------------------------------------------- */

USE MLBdb;

WITH avg_hw AS ( SELECT  FLOOR(YEAR(p.debut)/10)*10 AS decade, AVG(p.weight) as avg_weight, AVG(p.height) AS avg_height
			 FROM players p LEFT JOIN salaries s ON p.playerID = s.playerID
			 GROUP BY decade),
	
    
	 diff_hw AS (SELECT decade,
					   avg_weight - LAG(avg_weight) OVER(ORDER BY decade ASC) AS diff_weigh,
					   avg_height - LAG(avg_height) OVER(ORDER BY decade ASC) AS diff_heig
				FROM avg_hw
				ORDER BY decade)
                
SELECT *
FROM diff_hw
WHERE decade IS NOT NULL
ORDER BY decade

/* ---------------------------------------------------------
------------------Top 3 schools by decade-------------------
---------------------------------------------------------- */
USE MLBdb;

WITH decades_and_n_players AS ( SELECT 
									FLOOR(s.yearID / 10) * 10 AS decade,
									COUNT( DISTINCT s.playerID ) AS count_players,
									sd.name_full
								FROM schools s LEFT JOIN school_details sd ON s.schoolID = sd.schoolID
								GROUP BY decade, name_full),
	row_num_universities AS(
								SELECT 
									decade,
									count_players,
									name_full,
									ROW_NUMBER() OVER(PARTITION BY decade ORDER BY count_players DESC) AS row_num
									FROM decades_and_n_players)
		
SELECT 
	decade,
    name_full AS university,
    count_players AS n_of_players,
    row_num AS top_3_by_decade
FROM row_num_universities
WHERE row_num < 4 ;

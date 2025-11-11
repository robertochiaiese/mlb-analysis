/* ---------------------------------------------------------
-- In each decade, how many schools produced MLB players? --
---------------------------------------------------------- */

USE MLBdb;

SELECT playerID, TIMESTAMPDIFF( YEAR, birthDate, debut) AS age_debut,
	     finalGame,
       TIMESTAMPDIFF(YEAR,debut, finalGame) AS lenth_carrer_years
FROM ( SELECT 	
              playerID,
        			STR_TO_DATE((CONCAT(birthYear, '-',birthMonth,'-',birthDay)), '%Y-%m-%d') AS birthDate,
        			debut,
        			finalGame
       FROM players) t
ORDER BY lenth_carrer_years DESC;

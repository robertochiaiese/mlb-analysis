/* -----------------------------------------------------------------
---- For each player, calculate their age at their first (debut)----
---------- game, their last game, and their career length ----------
----------------------------------------------------------------- */

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

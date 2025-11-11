/* ---------------------------------------------------------
----------Which players have the same birthday? ------------
---------------------------------------------------------- */

USE MLBdb;

WITH brith_player AS (SELECT playerID, nameGiven, CONCAT(birthYear, '-', birthMonth, '-', birthDay) AS birthday
						  FROM players)

SELECT 	birthday, GROUP_CONCAT(nameGiven SEPARATOR ', ') AS birthday_guys
FROM	 brith_player 
WHERE birthday IS NOT NULL
GROUP BY birthday
ORDER BY birthday_guys ASC	;

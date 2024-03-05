SELECT 
stadium_has_sport.Stadium_Stadium_Name as Stadium_Name,
stadium_has_sport.Sport_Sport_Name as Sport_Name
FROM sport
JOIN stadium_has_sport
ON stadium_has_sport.Sport_Olympics_Year = sport.Olympics_Year
	AND stadium_has_sport.Sport_Olympics_Season = sport.Olympics_Season
	AND stadium_has_sport.Sport_Sport_Name = sport.Sport_Name
WHERE sport.Sport_Date = '2000-06-06'
	AND stadium_has_sport.Stadium_Stadium_Name = 'TOUMPA'
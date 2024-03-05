SELECT DISTINCT(athlete_has_sport.Sport_Sport_Name) as Sport_Name
FROM athlete_has_sponsor
JOIN athlete_has_sport
ON athlete_has_sponsor.Athlete_Athlete_id = athlete_has_sport.Athlete_Athlete_id
WHERE athlete_has_sport.Sport_Olympics_Year = 2000
	AND athlete_has_sport.Sport_Olympics_Season = 'summer'
	AND athlete_has_sponsor.Sponsor_Sponsor_Name = 'ABIBAS'
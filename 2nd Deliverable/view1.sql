SELECT 
athlete.Athlete_name,
sport.Sport_Date,
stadium_has_sport.Stadium_City,
stadium_has_sport.Stadium_Stadium_Name
FROM athlete_has_sport 
JOIN athlete ON athlete_has_sport.Athlete_Athlete_id = athlete.Athlete_id
JOIN sport ON (sport.Sport_Name = athlete_has_sport.Sport_Sport_Name AND sport.Olympics_Year = athlete_has_sport.Sport_Olympics_Year AND sport.Olympics_Season = athlete_has_sport.Sport_Olympics_Season)
JOIN stadium_has_sport ON (stadium_has_sport.Sport_Sport_Name = sport.Sport_Name AND stadium_has_sport.Sport_Olympics_Season = athlete_has_sport.Sport_Olympics_Season AND stadium_has_sport.Sport_Olympics_Year = athlete_has_sport.Sport_Olympics_Year)

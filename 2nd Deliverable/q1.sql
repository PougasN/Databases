SELECT athlete.Athlete_Name
FROM athlete
JOIN team
ON athlete.Team_Team_Name = team.Team_Name
WHERE Team_Name = 'GREECE';
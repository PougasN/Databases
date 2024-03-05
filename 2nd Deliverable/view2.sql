SELECT * 
FROM
(
	SELECT B.Year,
	B.Season,
	B.City,
	A.Team_Name,
	COUNT(A.Team_Name) AS Medals
	FROM(
		SELECT 
		athlete.Athlete_id,
		team.Team_Name,
		athlete_has_sport.Sport_Olympics_Season,
		athlete_has_sport.Sport_Olympics_Year,
		athlete_has_sport.Sport_Sport_Name
		FROM athlete
		JOIN team ON athlete.Team_Team_Name = team.Team_Name
		JOIN athlete_has_sport ON (athlete_has_sport.Athlete_Athlete_id = athlete.Athlete_id)
		WHERE athlete_has_sport.Standings < 4 AND athlete_has_sport.Round = 'F'
	) AS A
	JOIN(
		SELECT
		olympics.City,
		olympics.Country,
		olympics.Season,
		olympics.Year,
		sport.Sport_Name
		FROM olympics
		JOIN sport ON (sport.Olympics_Season = olympics.Season AND sport.Olympics_Year = olympics.Year)
	) AS B
	ON (B.Year = A.Sport_Olympics_Year AND B.Season = A.Sport_Olympics_Season AND B.Sport_Name = A.Sport_Sport_Name)
	GROUP BY A.Team_Name, B.Season,B.Year,B.City
)AS D WHERE (Team_Name,Year,Season,City,Medals) NOT IN(
	SELECT
	C.Team_Name,
	C.Year,
	C.Season,
	C.City,
	C.Medals
	FROM
	(
		SELECT B.Year,
		B.Season,
		B.City,
		A.Team_Name,
		COUNT(A.Team_Name) AS Medals
		FROM(
			SELECT 
			athlete.Athlete_id,
			team.Team_Name,
			athlete_has_sport.Sport_Olympics_Season,
			athlete_has_sport.Sport_Olympics_Year,
			athlete_has_sport.Sport_Sport_Name
			FROM athlete
			JOIN team ON athlete.Team_Team_Name = team.Team_Name
			JOIN athlete_has_sport ON (athlete_has_sport.Athlete_Athlete_id = athlete.Athlete_id)
			WHERE athlete_has_sport.Standings < 4 AND athlete_has_sport.Round = 'F'
		) AS A
		JOIN(
			SELECT
			olympics.City,
			olympics.Country,
			olympics.Season,
			olympics.Year,
			sport.Sport_Name
			FROM olympics
			JOIN sport ON (sport.Olympics_Season = olympics.Season AND sport.Olympics_Year = olympics.Year)
		) AS B
		ON (B.Year = A.Sport_Olympics_Year AND B.Season = A.Sport_Olympics_Season AND B.Sport_Name = A.Sport_Sport_Name)
		GROUP BY A.Team_Name, B.Season,B.Year,B.City
	) AS temp
	JOIN(
		SELECT B.Year,
		B.Season,
		B.City,
		A.Team_Name,
		COUNT(A.Team_Name) AS Medals
		FROM(
			SELECT 
			athlete.Athlete_id,
			team.Team_Name,
			athlete_has_sport.Sport_Olympics_Season,
			athlete_has_sport.Sport_Olympics_Year,
			athlete_has_sport.Sport_Sport_Name
			FROM athlete
			JOIN team ON athlete.Team_Team_Name = team.Team_Name
			JOIN athlete_has_sport ON (athlete_has_sport.Athlete_Athlete_id = athlete.Athlete_id)
			WHERE athlete_has_sport.Standings < 4 AND athlete_has_sport.Round = 'F'
		) AS A
		JOIN(
			SELECT
			olympics.City,
			olympics.Country,
			olympics.Season,
			olympics.Year,
			sport.Sport_Name
			FROM olympics
			JOIN sport ON (sport.Olympics_Season = olympics.Season AND sport.Olympics_Year = olympics.Year)
		) AS B
		ON (B.Year = A.Sport_Olympics_Year AND B.Season = A.Sport_Olympics_Season AND B.Sport_Name = A.Sport_Sport_Name)
		GROUP BY A.Team_Name, B.Season,B.Year,B.City
	) AS C
	WHERE (C.Medals < temp.Medals AND C.Year = temp.Year AND C.Season = temp.Season)
);


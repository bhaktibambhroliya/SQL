-- Task1 --

CREATE DATABASE IF NOT EXISTS IPL_Assignment;

USE IPL_Assignment;

CREATE TABLE IF NOT EXISTS ipl_matches (
    id INT PRIMARY KEY,
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    result VARCHAR(100)
);

INSERT INTO ipl_matches
(id, match_date, team1, team2, winner, result)
VALUES
(1, '2025-03-22', 'Kolkata Knight Riders', 'Royal Challengers Bengaluru', 'Royal Challengers Bengaluru', 'Wickets'),
(2, '2025-03-23', 'Sunrisers Hyderabad', 'Rajasthan Royals', 'Sunrisers Hyderabad', 'Runs'),
(3, '2025-03-23', 'Chennai Super Kings', 'Mumbai Indians', 'Chennai Super Kings', 'Runs'),
(4, '2025-03-24', 'Delhi Capitals', 'Lucknow Super Giants', 'Delhi Capitals', 'Wickets'),
(5, '2025-03-25', 'Gujarat Titans', 'Punjab Kings', 'Punjab Kings', 'Wickets'),
(6, '2025-03-26', 'Rajasthan Royals', 'Kolkata Knight Riders', 'Kolkata Knight Riders', 'Runs'),
(7, '2025-03-27', 'Sunrisers Hyderabad', 'Lucknow Super Giants', 'Lucknow Super Giants', 'Wickets'),
(8, '2025-03-28', 'Chennai Super Kings', 'Royal Challengers Bengaluru', 'Royal Challengers Bengaluru', 'Wickets'),
(9, '2025-03-29', 'Gujarat Titans', 'Mumbai Indians', 'Gujarat Titans', 'Runs'),
(10, '2025-03-30', 'Delhi Capitals', 'Sunrisers Hyderabad', 'Delhi Capitals', 'Runs'),
(11, '2025-03-31', 'Mumbai Indians', 'Kolkata Knight Riders', 'Mumbai Indians', 'Wickets'),
(12, '2025-04-01', 'Punjab Kings', 'Rajasthan Royals', 'Punjab Kings', 'Runs'),
(13, '2025-04-02', 'Royal Challengers Bengaluru', 'Gujarat Titans', 'Gujarat Titans', 'Wickets'),
(14, '2025-04-03', 'Kolkata Knight Riders', 'Sunrisers Hyderabad', 'Kolkata Knight Riders', 'Runs'),
(15, '2025-04-04', 'Lucknow Super Giants', 'Mumbai Indians', 'Mumbai Indians', 'Wickets'),
(16, '2025-04-05', 'Chennai Super Kings', 'Delhi Capitals', 'Delhi Capitals', 'Runs'),
(17, '2025-04-06', 'Mumbai Indians', 'Royal Challengers Bengaluru', 'Mumbai Indians', 'Runs'),
(18, '2025-04-07', 'Punjab Kings', 'Sunrisers Hyderabad', 'Sunrisers Hyderabad', 'Wickets'),
(19, '2025-04-08', 'Rajasthan Royals', 'Gujarat Titans', 'Rajasthan Royals', 'Runs'),
(20, '2025-04-09', 'Mumbai Indians', 'Chennai Super Kings', 'Chennai Super Kings', 'Wickets');

SELECT * FROM ipl_matches;

SELECT COUNT(*) AS total_matches
FROM ipl_matches;

-- Task2 --

USE IPL_Assignment;

SELECT *
FROM ipl_matches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';

-- Task3 --

USE IPL_Assignment;

SELECT
    team AS Team_Name,
    COUNT(*) AS Total_Matches
FROM (
    SELECT team1 AS team
    FROM ipl_matches

    UNION ALL

    SELECT team2 AS team
    FROM ipl_matches
) AS AllTeams
GROUP BY team
ORDER BY Total_Matches DESC;

-- Task4 --

USE IPL_Assignment;

SELECT
    winner AS Team_Name,
    COUNT(*) AS Total_Wins
FROM ipl_matches
WHERE winner IS NOT NULL
  AND winner <> ''
GROUP BY winner
ORDER BY Total_Wins DESC;

-- Task5 --

USE IPL_Assignment;

CREATE TABLE IF NOT EXISTS mi_wins (
    id INT PRIMARY KEY,
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    winner VARCHAR(100),
    result VARCHAR(100)
);

SELECT * FROM mi_wins;

SELECT COUNT(*) AS Total_Wins
FROM mi_wins;
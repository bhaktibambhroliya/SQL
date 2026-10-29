-- Task1 --

USE CTE_Assignment;

CREATE TABLE IF NOT EXISTS SpotifyArtists1 (
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers BIGINT
);

INSERT IGNORE INTO SpotifyArtists1 (artist_id, name, followers) VALUES
(1, 'Arijit Singh', 50000000),
(2, 'Taylor Swift', 100000000),
(3, 'Justin Bieber', 80000000),
(4, 'Shreya Ghoshal', 30000000),
(5, 'Ed Sheeran', 70000000);

WITH TopArtists AS (
    SELECT artist_id, name, followers
    FROM SpotifyArtists
    ORDER BY followers DESC
    LIMIT 3
)
SELECT *
FROM TopArtists;

-- Task2 --

CREATE TABLE FlipkartOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO FlipkartOrders VALUES
(1, 101, '2023-01-10', 5000),
(2, 102, '2023-01-15', 3000),
(3, 103, '2023-02-05', 7000),
(4, 104, '2023-02-20', 4000),
(5, 105, '2023-03-12', 10000),
(6, 106, '2023-03-18', 8000),
(7, 107, '2023-04-10', 6000);

WITH MonthlyTotals AS (
    SELECT
        MONTH(order_date) AS sales_month,
        SUM(total_amount) AS total_sales
    FROM FlipkartOrders
    WHERE YEAR(order_date) = 2023
    GROUP BY MONTH(order_date)
)
SELECT sales_month, total_sales
FROM MonthlyTotals
ORDER BY total_sales DESC
LIMIT 1;

-- Task3 --

CREATE TABLE CalendarDays (
    day_date DATE
);

WITH RECURSIVE DateList AS (
    SELECT CURDATE() AS day_date

    UNION ALL

    SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    FROM DateList
    WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 5 DAY)
)
SELECT day_date
FROM DateList;

-- Task4 --

CREATE TABLE ZomatoRestaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO ZomatoRestaurants VALUES
(1, 'Restaurant A', 'Ahmedabad', 4.5),
(2, 'Restaurant B', 'Ahmedabad', 4.2),
(3, 'Restaurant C', 'Surat', 3.8),
(4, 'Restaurant D', 'Surat', 4.0),
(5, 'Restaurant E', 'Mumbai', 4.6),
(6, 'Restaurant F', 'Mumbai', 4.4);

WITH CityRatings AS (
    SELECT
        city,
        AVG(rating) AS avg_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT
    r.id,
    r.name,
    r.city,
    r.rating
FROM ZomatoRestaurants r
JOIN CityRatings c
    ON r.city = c.city
WHERE c.avg_rating > 4.0;

-- Task5 --

CREATE TABLE IPLMatches (
    match_id INT,
    team VARCHAR(100),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches VALUES
(1, 'Chennai Super Kings', 220, 2023),
(2, 'Chennai Super Kings', 210, 2023),
(3, 'Mumbai Indians', 230, 2023),
(4, 'Mumbai Indians', 180, 2023),
(5, 'Royal Challengers Bangalore', 250, 2023),
(6, 'Royal Challengers Bangalore', 200, 2023),
(7, 'Gujarat Titans', 190, 2023),
(8, 'Gujarat Titans', 210, 2023);

WITH TeamTotals AS (
    SELECT
        team,
        SUM(runs) AS total_runs
    FROM IPLMatches
    WHERE match_year = 2023
    GROUP BY team
)
SELECT team, total_runs
FROM TeamTotals
WHERE total_runs > 2000
ORDER BY total_runs DESC;
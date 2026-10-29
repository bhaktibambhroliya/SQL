-- Task1 --

CREATE DATABASE Ranking_Assignment;
USE Ranking_Assignment;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1, 101, '2026-01-10', 500),
(2, 101, '2026-03-15', 1200),
(3, 101, '2026-02-20', 800),
(4, 102, '2026-01-05', 700),
(5, 102, '2026-03-10', 1500),
(6, 103, '2026-02-12', 900);

SELECT
    order_id,
    user_id,
    order_date,
    total_amount,
    ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY order_date DESC
    ) AS row_num
FROM Orders;

-- Task2 --

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams BIGINT
);

INSERT INTO Songs VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Arijit Singh', 8000000),
(3, 'Arijit Singh', 5000000),
(4, 'Arijit Singh', 3000000),
(5, 'Shreya Ghoshal', 7000000),
(6, 'Shreya Ghoshal', 9000000),
(7, 'Shreya Ghoshal', 4000000);

SELECT
    song_id,
    artist,
    streams,
    RANK() OVER (
        PARTITION BY artist
        ORDER BY streams DESC
    ) AS song_rank
FROM Songs;

-- Task3 --

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    rating DECIMAL(3,1)
);

INSERT INTO Movies VALUES
(1, 'Action', 8.5),
(2, 'Action', 9.0),
(3, 'Action', 8.5),
(4, 'Action', 7.5),
(5, 'Comedy', 8.0),
(6, 'Comedy', 9.0),
(7, 'Comedy', 7.0);

SELECT
    movie_id,
    genre,
    rating,
    DENSE_RANK() OVER (
        PARTITION BY genre
        ORDER BY rating DESC
    ) AS movie_rank
FROM Movies;

-- Task4 --

CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers BIGINT
);

INSERT INTO Influencers VALUES
(1, 'Instagram', 500000),
(2, 'Instagram', 900000),
(3, 'Instagram', 700000),
(4, 'Instagram', 300000),
(5, 'Instagram', 1000000),
(6, 'YouTube', 800000),
(7, 'YouTube', 1200000),
(8, 'YouTube', 600000),
(9, 'YouTube', 1500000),
(10, 'YouTube', 400000);

WITH InfluencerRanking AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT
    id,
    platform,
    followers,
    row_num
FROM InfluencerRanking
WHERE row_num <= 3
ORDER BY platform, row_num;


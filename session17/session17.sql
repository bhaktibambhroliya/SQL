-- Task1 --

CREATE DATABASE CaseWhen_Assignment;
USE CaseWhen_Assignment;

CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO FoodOrders VALUES
(1, 101, 200),
(2, 102, 500),
(3, 103, 1200),
(4, 104, 299),
(5, 105, 999),
(6, 106, 1500);

SELECT
    order_id,
    user_id,
    total_amount,
    CASE
        WHEN total_amount < 300 THEN 'Small'
        WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
        ELSE 'Large'
    END AS order_category
FROM FoodOrders;

-- Task2 --

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO Movies VALUES
(1, 'Movie A', 9.0),
(2, 'Movie B', 7.5),
(3, 'Movie C', 4.5),
(4, 'Movie D', 8.0),
(5, 'Movie E', 6.0),
(6, 'Movie F', 3.0);

SELECT
    movie_id,
    movie_name,
    rating,
    CASE
        WHEN rating >= 8 THEN 'Blockbuster'
        WHEN rating >= 5 THEN 'Hit'
        ELSE 'Average'
    END AS popularity
FROM Movies;

-- Task3 --

CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO FlipkartProducts VALUES
(1, 'Mouse', 300),
(2, 'Keyboard', 800),
(3, 'Monitor', 5000),
(4, 'Headphones', 1500),
(5, 'USB Cable', 200),
(6, 'Smartphone', 15000);

SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN price < 500 THEN 'Budget'
        WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
        ELSE 'Premium'
    END AS price_category
FROM FlipkartProducts;

-- Task4 --

CREATE TABLE SpotifyTracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(100),
    duration_sec INT
);

INSERT INTO SpotifyTracks VALUES
(1, 'Song A', 150),
(2, 'Song B', 200),
(3, 'Song C', 350),
(4, 'Song D', 180),
(5, 'Song E', 300),
(6, 'Song F', 120);

SELECT
    track_id,
    track_name,
    duration_sec,
    CASE
        WHEN duration_sec < 180 THEN 'Short'
        WHEN duration_sec BETWEEN 180 AND 300 THEN 'Medium'
        ELSE 'Long'
    END AS duration_label
FROM SpotifyTracks;
-- Task1 --

USE RestaurantDB;

SELECT *
FROM Restaurants_Task4
LIMIT 5;

-- task2 --

CREATE DATABASE IF NOT EXISTS MovieDB;
USE MovieDB;

CREATE TABLE IF NOT EXISTS movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);

SELECT *
FROM movies
WHERE rating > 8;

-- Task3 --

CREATE DATABASE IF NOT EXISTS ZomatoDB;
USE ZomatoDB;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    food_item VARCHAR(100),
    quantity INT
);

SELECT
    food_item,
    SUM(quantity) AS total_ordered
FROM (
    SELECT *
    FROM orders
    ORDER BY order_id DESC
    LIMIT 100
) AS last_orders
GROUP BY food_item
ORDER BY total_ordered DESC
LIMIT 3;

-- Task4 --

CREATE DATABASE IF NOT EXISTS IPLDB;
USE IPLDB;

CREATE TABLE IF NOT EXISTS matches (
    match_id INT PRIMARY KEY,
    team1 VARCHAR(100),
    team2 VARCHAR(100)
);

SELECT
    team AS Team,
    COUNT(*) AS Matches_Played
FROM (
    SELECT team1 AS team FROM matches
    UNION ALL
    SELECT team2 AS team FROM matches
) AS all_teams
GROUP BY team
ORDER BY Matches_Played DESC;

-- Task5 --

CREATE DATABASE IF NOT EXISTS OrdersDB;
USE OrdersDB;

CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS ordersDB (
    order_id INT PRIMARY KEY,
    user_id INT
);

USE OrdersDB;

INSERT INTO users (user_id, name)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Neha'),
(5, 'Riya')
ON DUPLICATE KEY UPDATE name = VALUES(name);

INSERT INTO ordersDB (order_id, user_id)
VALUES
(101, 1), (102, 1), (103, 1), (104, 1), (105, 1), (106, 1),
(107, 2), (108, 2), (109, 2),
(110, 3), (111, 3), (112, 3), (113, 3), (114, 3), (115, 3), (116, 3),
(117, 4), (118, 4),
(119, 5), (120, 5), (121, 5), (122, 5), (123, 5), (124, 5);

SELECT
    u.user_id,
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users AS u
INNER JOIN ordersDB AS o
    ON u.user_id = o.user_id
GROUP BY u.user_id, u.name
HAVING COUNT(o.order_id) > 5
ORDER BY total_orders DESC;
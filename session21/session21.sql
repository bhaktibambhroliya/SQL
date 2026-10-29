-- Task1 --

CREATE DATABASE IF NOT EXISTS RestaurantDB1;

USE RestaurantDB;

CREATE TABLE Restaurants1 (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

SELECT * FROM Restaurants1;

-- Task2 --

SHOW DATABASES;

USE RestaurantDB;

SHOW TABLES;

SHOW COLUMNS FROM Restaurants;

-- Task3 --


CREATE DATABASE IF NOT EXISTS RestaurantDB3;

USE RestaurantDB;

CREATE TABLE IF NOT EXISTS RestaurantsDB3 (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

DESCRIBE RestaurantsDB3;

INSERT INTO RestaurantsDB3 (restaurant_id, name, cuisine, rating)
VALUES
(1, 'Spice Garden', 'Chinese', 4.5),
(2, 'South Spice', 'South Indian', 4.7),
(3, 'Pizza Corner', 'Italian', 3.8),
(4, 'Dragon Palace', 'Chinese', 4.2),
(5, 'Dosa House', 'South Indian', 4.8),
(6, 'Burger Point', 'Fast Food', 3.9),
(7, 'Royal Punjabi', 'North Indian', 4.4),
(8, 'Tasty Treat', 'Chinese', 3.5),
(9, 'Food Junction', 'Italian', 4.1),
(10, 'Madras Cafe', 'South Indian', 4.6),
(11, 'New Food Cafe', 'Chinese', 4.3);

SELECT * FROM RestaurantsDB3;

SELECT restaurant_id, name, cuisine, rating
FROM RestaurantsDB3
WHERE cuisine = 'Chinese';

SELECT restaurant_id, name, cuisine, rating
FROM RestaurantsDB3
WHERE cuisine = 'South Indian';

-- Task4 --

CREATE DATABASE IF NOT EXISTS RestaurantDB4;

USE RestaurantDB4;

CREATE TABLE IF NOT EXISTS Restaurants_Task4 (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants_Task4
    (restaurant_id, name, cuisine, rating)
VALUES
    (1, 'Spice Garden', 'Chinese', 4.5),
    (2, 'South Spice', 'South Indian', 4.7),
    (3, 'Pizza Corner', 'Italian', 3.8),
    (4, 'Dragon Palace', 'Chinese', 4.2),
    (5, 'Dosa House', 'South Indian', 4.8),
    (6, 'Burger Point', 'Fast Food', 3.9),
    (7, 'Royal Punjabi', 'North Indian', 4.4),
    (8, 'Tasty Treat', 'Chinese', 3.5),
    (9, 'Food Junction', 'Italian', 4.1),
    (10, 'Madras Cafe', 'South Indian', 4.6),
    (11, 'New Food Cafe', 'Chinese', 4.3)
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    cuisine = VALUES(cuisine),
    rating = VALUES(rating);

SELECT * FROM Restaurants_Task4;

SELECT
    restaurant_id,
    name,
    cuisine,
    rating
FROM Restaurants_Task4
WHERE rating > 4.0
ORDER BY rating DESC;

-- Task5 --

USE RestaurantDB;

SHOW TABLES;

USE RestaurantDB;

CREATE TABLE IF NOT EXISTS Restaurants_Task4 (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants_Task4
(restaurant_id, name, cuisine, rating)
VALUES
(1, 'Spice Garden', 'Chinese', 4.5),
(2, 'South Spice', 'South Indian', 4.7),
(3, 'Pizza Corner', 'Italian', 3.8),
(4, 'Dragon Palace', 'Chinese', 4.2),
(5, 'Dosa House', 'South Indian', 4.8),
(6, 'Burger Point', 'Fast Food', 3.9),
(7, 'Royal Punjabi', 'North Indian', 4.4),
(8, 'Tasty Treat', 'Chinese', 3.5),
(9, 'Food Junction', 'Italian', 4.1),
(10, 'Madras Cafe', 'South Indian', 4.6),
(11, 'New Food Cafe', 'Chinese', 4.3)
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    cuisine = VALUES(cuisine),
    rating = VALUES(rating);
    
USE RestaurantDB;

SET @MinRating = 3.5;
SET @MaxRating = 5.0;

SELECT
    restaurant_id,
    name,
    cuisine,
    rating
FROM Restaurants_Task4
WHERE rating BETWEEN @MinRating AND @MaxRating
ORDER BY rating DESC;
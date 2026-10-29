CREATE DATABASE Subquery_Assignment;
USE Subquery_Assignment;

-- TASK 1 --

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO Restaurants VALUES
(1, 'Pizza Palace', 4.5),
(2, 'Burger House', 3.8),
(3, 'Spice Garden', 4.8),
(4, 'Food Corner', 3.5),
(5, 'Royal Restaurant', 4.2);

SELECT
    restaurant_name,
    rating
FROM Restaurants
WHERE rating > (
    SELECT AVG(rating)
    FROM Restaurants
);

-- TASK 2 -- 

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Laptop', 50000, 'Electronics'),
(2, 'Mobile', 20000, 'Electronics'),
(3, 'Headphones', 2000, 'Electronics'),
(4, 'T-Shirt', 800, 'Fashion'),
(5, 'Jeans', 1500, 'Fashion'),
(6, 'Shoes', 2500, 'Fashion');

SELECT
    p.name,
    p.price,
    p.category,
    (
        SELECT AVG(p2.price)
        FROM Products p2
        WHERE p2.category = p.category
    ) AS category_average_price
FROM Products p;

-- TASK 3 --

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100)
);

CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100)
);

INSERT INTO Users VALUES
(1, 'Amit'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Neha'),
(5, 'Karan');

INSERT INTO Playlists VALUES
(101, 1, 'Bollywood Hits'),
(102, 1, 'Romantic Songs'),
(103, 1, 'Party Songs'),
(104, 2, 'Workout Music'),
(105, 2, 'Old Songs'),
(106, 3, 'Travel Music'),
(107, 4, 'Chill Vibes'),
(108, 4, 'Favorite Songs'),
(109, 4, 'Trending Songs'),
(110, 4, 'Relaxing Music');

SELECT
    u.username,
    playlist_counts.total_playlists
FROM Users u
JOIN (
    SELECT
        user_id,
        COUNT(*) AS total_playlists
    FROM Playlists
    GROUP BY user_id
) AS playlist_counts
ON u.user_id = playlist_counts.user_id
WHERE playlist_counts.total_playlists > (
    SELECT AVG(user_playlist_count)
    FROM (
        SELECT COUNT(*) AS user_playlist_count
        FROM Playlists
        GROUP BY user_id
    ) AS average_counts
);

-- TASK 4 --

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders VALUES
(1, 101, 250),
(2, 102, 500),
(3, 101, 1000),
(4, 103, 300),
(5, 104, 1500),
(6, 102, 700),
(7, 105, 200);

SELECT DISTINCT user_id
FROM Orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM Orders
);
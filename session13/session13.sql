-- Task1 --

CREATE DATABASE WindowFunction_Assignment;
USE WindowFunction_Assignment;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_amount DECIMAL(10,2),
    app_name VARCHAR(50)
);

INSERT INTO Orders (order_id, user_id, order_amount, app_name) VALUES
(1, 101, 500.00, 'Zomato'),
(2, 102, 1200.00, 'Flipkart'),
(3, 101, 300.00, 'Swiggy'),
(4, 103, 800.00, 'Zomato'),
(5, 104, 1500.00, 'Flipkart'),
(6, 102, 700.00, 'Swiggy'),
(7, 105, 400.00, 'Zomato'),
(8, 103, 2000.00, 'Flipkart'),
(9, 104, 600.00, 'Swiggy'),
(10, 101, 900.00, 'Zomato');

SELECT
    order_id,
    user_id,
    order_amount,
    app_name,
    SUM(order_amount) OVER() AS total_order_amount
FROM Orders;

-- Task2 --

SELECT
    user_id,
    order_id,
    order_amount,
    AVG(order_amount) OVER(
        PARTITION BY user_id
    ) AS user_average_amount
FROM Orders;

-- Task3 --

CREATE TABLE Playlist (
    song_id INT PRIMARY KEY,
    user_id INT,
    duration_sec INT
);

INSERT INTO Playlist (song_id, user_id, duration_sec) VALUES
(1, 101, 180),
(2, 101, 240),
(3, 102, 200),
(4, 102, 300),
(5, 101, 210),
(6, 103, 250),
(7, 103, 190),
(8, 104, 220),
(9, 104, 260),
(10, 102, 180);

SELECT
    song_id,
    user_id,
    duration_sec,
    SUM(duration_sec) OVER(
        PARTITION BY user_id
    ) AS total_duration_sec
FROM Playlist;

-- Task4 --

CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT,
    movie_name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO MovieRatings (rating_id, user_id, movie_name, rating) VALUES
(1, 101, 'Pathaan', 5),
(2, 102, 'Pathaan', 4),
(3, 103, 'Pathaan', 3),
(4, 101, 'Jawan', 4),
(5, 102, 'Jawan', 5),
(6, 104, 'Jawan', 4),
(7, 103, 'Animal', 5),
(8, 104, 'Animal', 4),
(9, 105, 'Animal', 3),
(10, 101, 'Animal', 4);

SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    ROUND(
        AVG(rating) OVER(
            PARTITION BY movie_name
        ), 2
    ) AS average_movie_rating,
    ROUND(
        rating - AVG(rating) OVER(
            PARTITION BY movie_name
        ), 2
    ) AS rating_difference
FROM MovieRatings;

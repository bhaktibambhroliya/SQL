CREATE DATABASE GroupBy_Assignment;
USE GroupBy_Assignment;

-- TASK 1 --

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO food_orders VALUES
(1, 101, 250.00),
(2, 102, 450.00),
(3, 101, 300.00),
(4, 103, 150.00),
(5, 102, 500.00),
(6, 101, 200.00),
(7, 104, 350.00),
(8, 103, 400.00);

SELECT
    user_id,
    COUNT(*) AS total_orders
FROM food_orders
GROUP BY user_id;

-- TASK 2 --

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50)
);

INSERT INTO transactions VALUES
(1, 101, 500.00, 'UPI'),
(2, 102, 1000.00, 'Credit Card'),
(3, 101, 250.00, 'UPI'),
(4, 103, 750.00, 'Debit Card'),
(5, 102, 1500.00, 'Credit Card'),
(6, 104, 300.00, 'Cash'),
(7, 103, 400.00, 'Debit Card'),
(8, 104, 600.00, 'UPI');

SELECT
    payment_method,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY payment_method;

-- TASK 3 --

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    box_office_collection DECIMAL(12,2)
);

INSERT INTO movies VALUES
(1, 'Action', 8.50),
(2, 'Comedy', 3.00),
(3, 'Action', 5.00),
(4, 'Drama', 6.50),
(5, 'Comedy', 4.00),
(6, 'Drama', 5.00),
(7, 'Romance', 2.50),
(8, 'Action', 4.00),
(9, 'Romance', 3.00);

SELECT
    genre,
    SUM(box_office_collection) AS total_collection
FROM movies
GROUP BY genre
HAVING SUM(box_office_collection) > 10;

-- TASK 4 -- 

CREATE TABLE playlist1 (
    playlist_id INT,
    user_id INT,
    song_id INT,
    duration INT
);

INSERT INTO playlist1 VALUES
(1, 101, 1001, 2400),
(1, 101, 1002, 2600),
(1, 101, 1003, 2500),
(2, 102, 1004, 1800),
(2, 102, 1005, 2000),
(3, 103, 1006, 3000),
(3, 103, 1007, 2800),
(3, 103, 1008, 2200),
(4, 104, 1009, 1500),
(4, 104, 1010, 1800);

SELECT
    user_id,
    SUM(duration) AS total_duration
FROM playlist
GROUP BY user_id
HAVING SUM(duration) > 7200;
USE Aggregate_Assignment;

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
(6, 101, 200.00);

SELECT SUM(amount) AS total_amount
FROM food_orders;

-- TASK 2 --

CREATE TABLE spotify_playlists (
    playlist_id INT,
    user_id INT,
    song_id INT
);

INSERT INTO spotify_playlists VALUES
(1, 101, 1001),
(1, 101, 1002),
(1, 101, 1003),
(2, 102, 1004),
(2, 102, 1005),
(3, 103, 1006),
(3, 103, 1007),
(3, 103, 1008),
(3, 103, 1009);

SELECT
    user_id,
    COUNT(song_id) AS total_songs
FROM spotify_playlists
GROUP BY user_id;

-- TASK 3 --

CREATE TABLE bookmyshow_reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(3,1)
);

INSERT INTO bookmyshow_reviews VALUES
(1, 201, 4.0),
(2, 201, 5.0),
(3, 201, 3.0),
(4, 202, 4.5),
(5, 202, 3.5),
(6, 202, 5.0),
(7, 203, 4.0),
(8, 203, 4.5);

SELECT
    movie_id,
    ROUND(AVG(rating), 1) AS average_rating
FROM bookmyshow_reviews
GROUP BY movie_id;

-- TASK 4 --

CREATE TABLE paytm_transactions (
    txn_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO paytm_transactions VALUES
(1, 101, 500.00),
(2, 101, 1500.00),
(3, 101, 250.00),
(4, 102, 2000.00),
(5, 102, 750.00),
(6, 102, 1200.00),
(7, 103, 100.00),
(8, 103, 900.00);

SELECT
    user_id,
    MIN(amount) AS minimum_transaction,
    MAX(amount) AS maximum_transaction
FROM paytm_transactions
GROUP BY user_id;

-- TASK 5 --

CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders VALUES
(1, 101, 1500.00),
(2, 101, 2500.00),
(3, 101, 1000.00),
(4, 102, 3000.00),
(5, 102, 4500.00),
(6, 103, 1200.00),
(7, 103, 1800.00),
(8, 103, 2200.00),
(9, 104, 5000.00),
(10, 104, 3500.00);

SELECT
    user_id,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(total_price), 2) AS average_order_value,
    MAX(total_price) AS highest_order_value
FROM myntra_orders
GROUP BY user_id;
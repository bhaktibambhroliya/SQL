-- Task1 --

CREATE DATABASE StringFunctions_Assignment;
USE StringFunctions_Assignment;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO users VALUES
(1, 'Rahul', 'Sharma'),
(2, 'Priya', 'Patel'),
(3, 'Amit', 'Verma'),
(4, 'Neha', 'Shah'),
(5, 'Riya', 'Joshi');

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM users;

-- Task2 --

CREATE TABLE playlists (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100)
);

INSERT INTO playlists VALUES
(1, 'Kesariya'),
(2, 'Tum Hi Ho'),
(3, 'Apna Bana Le'),
(4, 'Channa Mereya'),
(5, 'Heeriye');

SELECT
    UPPER(song_title) AS uppercase_title
FROM playlists;

-- Task3 --

CREATE TABLE food_items (
    item_id INT PRIMARY KEY,
    item_code VARCHAR(50)
);

INSERT INTO food_items VALUES
(1, '  FOOD101  '),
(2, ' SNACK202'),
(3, 'DRINK303  '),
(4, '  FRUIT404'),
(5, 'DAIRY505');

SELECT
    TRIM(item_code) AS trimmed_item_code
FROM food_items;

-- Task4 --

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    imdb_id VARCHAR(20)
);

INSERT INTO movies VALUES
(1, 'tt1234567'),
(2, 'tt7654321'),
(3, 'tt9876543'),
(4, 'tt4567890'),
(5, 'tt1122334');

SELECT
    imdb_id,
    RIGHT(imdb_id, 7) AS movie_number
FROM movies;

-- Task5 --

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    sku_code VARCHAR(50)
);

INSERT INTO products VALUES
(1, 'MOB-123-XY'),
(2, 'LAP-456-AB'),
(3, 'TAB-789-CD'),
(4, 'TV-101-EF'),
(5, 'CAM-202-GH');

SELECT
    sku_code,
    REPLACE(sku_code, '-', '_') AS updated_sku_code
FROM products;
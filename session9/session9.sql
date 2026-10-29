CREATE DATABASE Advanced_Join_Assignment;
USE Advanced_Join_Assignment;

-- TASK 1 --

CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO influencers VALUES
(1, 'Amit Sharma', 'Ahmedabad'),
(2, 'Priya Patel', 'Surat'),
(3, 'Rahul Shah', 'Mumbai'),
(4, 'Neha Mehta', 'Delhi');

INSERT INTO brands VALUES
(101, 'Flipkart', 'Ahmedabad'),
(102, 'Myntra', 'Surat'),
(103, 'Amazon', 'Bangalore'),
(104, 'Ajio', 'Pune');

SELECT
    i.influencer_name,
    b.brand_name,
    i.city AS influencer_city,
    b.city AS brand_city
FROM influencers i
LEFT JOIN brands b
ON i.city = b.city

UNION

SELECT
    i.influencer_name,
    b.brand_name,
    i.city AS influencer_city,
    b.city AS brand_city
FROM influencers i
RIGHT JOIN brands b
ON i.city = b.city;

-- TASK 2 --

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO playlists VALUES
(1, 'My Music', NULL),
(2, 'Bollywood Songs', 1),
(3, 'Romantic Songs', 1),
(4, 'Old Songs', 2),
(5, 'Party Songs', 1);

SELECT
    p.playlist_name AS playlist_name,
    parent.playlist_name AS parent_playlist_name
FROM playlists p
LEFT JOIN playlists parent
ON p.parent_playlist_id = parent.id;

-- TASK 3 --

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO users VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Rahul', 'Mumbai');

INSERT INTO offers VALUES
(101, '10% Discount'),
(102, 'Free Delivery'),
(103, 'Buy 1 Get 1');

INSERT INTO users VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Rahul', 'Mumbai');

INSERT INTO offers VALUES
(101, '10% Discount'),
(102, 'Free Delivery'),
(103, 'Buy 1 Get 1');

SELECT
    u.user_name,
    o.offer_title
FROM users u
CROSS JOIN offers o;

-- TASK 4 --

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Rajesh', NULL),
(2, 'Amit', 1),
(3, 'Priya', 1),
(4, 'Neha', 2),
(5, 'Rahul', 2),
(6, 'Karan', NULL);

SELECT
    e.name AS employee_name,
    m.name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.id;

SELECT
    name AS employee_name
FROM employees
WHERE manager_id IS NULL;

-- TASK 5--

SELECT
    u1.user_name AS user1,
    u2.user_name AS user2,
    u1.city
FROM users u1
INNER JOIN users u2
ON u1.city = u2.city
AND u1.user_id < u2.user_id;
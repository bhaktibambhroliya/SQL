CREATE DATABASE Join_Assignment;
USE Join_Assignment;

-- TASK 1 --

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2)
);

INSERT INTO Users (user_id, username, city) VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Rahul', 'Vadodara'),
(4, 'Neha', 'Rajkot');

INSERT INTO Orders (order_id, user_id, product, amount) VALUES
(101, 1, 'Pizza', 350.00),
(102, 2, 'Burger', 200.00),
(103, 1, 'Pasta', 250.00),
(104, 3, 'Sandwich', 150.00),
(105, 2, 'Biryani', 300.00),
(106, 99, 'Coffee', 100.00);

SELECT * FROM Users;

SELECT * FROM Orders;

-- TASK 2--

SELECT
    Users.username,
    Orders.product
FROM Users
INNER JOIN Orders
ON Users.user_id = Orders.user_id;

-- TASK 3 --

SELECT
    Users.username,
    Orders.product
FROM Users
LEFT JOIN Orders
ON Users.user_id = Orders.user_id;

-- TASK 4 --

SELECT
    Orders.order_id,
    Orders.product,
    Orders.user_id,
    Users.username
FROM Users
RIGHT JOIN Orders
ON Users.user_id = Orders.user_id;

-- TASK 5 --

CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50)
);

ALTER TABLE Users
ADD segment_id INT;


INSERT INTO CustomerSegments VALUES
(1, 'Regular Customer'),
(2, 'Premium Customer'),
(3, 'New Customer');


UPDATE Users
SET segment_id = 1
WHERE user_id = 1;

UPDATE Users
SET segment_id = 2
WHERE user_id = 2;

UPDATE Users
SET segment_id = 1
WHERE user_id = 3;

UPDATE Users
SET segment_id = 3
WHERE user_id = 4;


ALTER TABLE Users
ADD CONSTRAINT fk_user_segment
FOREIGN KEY (segment_id)
REFERENCES CustomerSegments(segment_id);

SELECT
    Users.username,
    CustomerSegments.segment_name,
    COALESCE(SUM(Orders.amount), 0) AS total_order_amount
FROM Users
LEFT JOIN CustomerSegments
    ON Users.segment_id = CustomerSegments.segment_id
LEFT JOIN Ordersss
    ON Users.user_id = Orders.user_id
GROUP BY
    Users.user_id,
    Users.username,
    CustomerSegments.segment_name;
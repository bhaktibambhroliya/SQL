CREATE DATABASE Union_Assignment;
USE Union_Assignment;

-- TASK 1--

CREATE TABLE AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders VALUES
(1, 'Amit', 250.00, '2026-10-20'),
(2, 'Priya', 450.00, '2026-10-21'),
(3, 'Rahul', 300.00, '2026-10-22');

INSERT INTO InStoreOrders VALUES
(101, 'Neha', 500.00, '2026-10-20'),
(102, 'Amit', 350.00, '2026-10-21'),
(103, 'Karan', 400.00, '2026-10-22');

SELECT * FROM AppOrders;

SELECT * FROM InStoreOrders;

-- Task2 --

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

-- TASK 3 --

SELECT order_id, customer_name, amount, order_date
FROM AppOrders

UNION ALL

SELECT order_id, customer_name, amount, order_date
FROM InStoreOrders;

-- TASK 4 --

INSERT INTO InStoreOrders VALUES
(104, 'Priya', 600.00, '2026-10-23');


SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

SELECT customer_name
FROM AppOrders

UNION ALL

SELECT customer_name
FROM InStoreOrders;


SELECT COUNT(*) AS union_count
FROM (
    SELECT customer_name
    FROM AppOrders

    UNION

    SELECT customer_name
    FROM InStoreOrders
) AS unique_customers;


SELECT COUNT(*) AS union_all_count
FROM (
    SELECT customer_name
    FROM AppOrders

    UNION ALL

    SELECT customer_name
    FROM InStoreOrders
) AS all_customers;
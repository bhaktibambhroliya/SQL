-- Task1 --

CREATE DATABASE IF NOT EXISTS IndexAssignment;
USE IndexAssignment;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

USE IndexAssignment;

SET SESSION cte_max_recursion_depth = 10000;

INSERT INTO orders (order_id, user_id, order_date, amount)
WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 10000
)
SELECT
    n,
    MOD(n, 1000) + 1,
    DATE_SUB(CURDATE(), INTERVAL MOD(n, 365) DAY),
    MOD(n * 37, 5000) + 100
FROM numbers;

SELECT COUNT(*) AS total_orders
FROM orders;

-- Task2 --

CREATE INDEX idx_user_id
ON orders(user_id);

SELECT *
FROM orders
WHERE user_id = 101;


-- Task3 --

EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

-- Task4 --

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 45000),
(2, 'Mobile', 'Electronics', 20000),
(3, 'T-Shirt', 'Clothing', 500),
(4, 'Jeans', 'Clothing', 1200),
(5, 'Chair', 'Furniture', 2500);

CREATE INDEX idx_category
ON products(category);

SELECT product_id, product_name, category, price
FROM products
WHERE category = 'Electronics';

EXPLAIN
SELECT product_id, product_name, category, price
FROM products
WHERE category = 'Electronics';


-- Task5 --

EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

SELECT *
FROM orders
WHERE user_id = 101;

SELECT order_id, order_date, amount
FROM orders
WHERE user_id = 101;

SET SESSION cte_max_recursion_depth = 10000;
-- Task1 --

use tops;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    payment_method VARCHAR(50)
);

INSERT INTO orders VALUES
(1, 'UPI'),
(2, 'Cash'),
(3, 'Credit Card'),
(4, 'UPI'),
(5, 'Debit Card'),
(6, 'Cash'),
(7, 'Net Banking'),
(8, 'Credit Card');

SELECT DISTINCT payment_method
FROM orders;

-- Task2 --

CREATE TABLE users2 (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO users2 VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Neha', 'Surat'),
(3, 'Raj', 'Mumbai'),
(4, 'Priya', 'Ahmedabad'),
(5, 'Rahul', 'Vadodara'),
(6, 'Pooja', 'Surat'),
(7, 'Karan', 'Delhi');

SELECT DISTINCT city
FROM users2
ORDER BY city ASC;

-- Task3 --

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    booking_date DATE
);

INSERT INTO bookings VALUES
(1, 'Pushpa 2', '2026-10-20'),
(2, 'Jawan', '2026-10-25'),
(3, 'Stree 2', '2026-10-22'),
(4, 'Dangal', '2026-10-28'),
(5, 'Pathaan', '2026-10-24'),
(6, 'KGF 2', '2026-10-26'),
(7, 'Animal', '2026-10-21');

SELECT * FROM bookings
ORDER BY booking_date DESC
LIMIT 5;


-- Task 4 --

CREATE TABLE products2(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO products2 VALUES
(1, 'Laptop', 'Electronics', 500),
(2, 'Mobile', 'Electronics', 900),
(3, 'Headphones', 'Electronics', 700),
(4, 'Shoes', 'Fashion', 400),
(5, 'T-Shirt', 'Fashion', 300),
(6, 'Smart Watch', 'Electronics', 650),
(7, 'Backpack', 'Accessories', 250),
(8, 'Keyboard', 'Electronics', 550),
(9, 'Mouse', 'Electronics', 600),
(10, 'Jeans', 'Fashion', 350),
(11, 'Tablet', 'Electronics', 450),
(12, 'Charger', 'Electronics', 800);

SELECT name, sold_count
FROM products2
ORDER BY sold_count DESC
LIMIT 10;
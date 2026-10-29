-- Task1 --

SELECT NOW() AS CurrentDateTime;

-- Task2 --

CREATE DATABASE DateTime_Assignment;
USE DateTime_Assignment;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE
);

INSERT INTO Orders VALUES
(1, '2026-01-15'),
(2, '2026-03-20'),
(3, '2025-12-10'),
(4, '2026-07-25'),
(5, '2024-09-05');

SELECT
    order_id,
    order_date,
    YEAR(order_date) AS OrderYear,
    MONTH(order_date) AS OrderMonth,
    DAY(order_date) AS OrderDay
FROM Orders;

-- Task3 --

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);

INSERT INTO Deliveries VALUES
(1, '2026-11-05'),
(2, '2026-11-10'),
(3, '2026-11-15'),
(4, '2026-12-01'),
(5, '2026-12-10');

SELECT
    delivery_date,
    DATE_SUB(delivery_date, INTERVAL 2 DAY) AS expected_pickup_date
FROM Deliveries;

-- Task4 --

CREATE TABLE Subscriptions (
    user_id INT,
    start_date DATE,
    end_date DATE
);

INSERT INTO Subscriptions VALUES
(101, '2026-01-01', '2026-01-31'),
(102, '2026-02-01', '2026-03-01'),
(103, '2026-04-10', '2026-04-20'),
(104, '2026-05-01', '2026-06-01'),
(105, '2026-07-15', '2026-08-15');

SELECT
    user_id,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS total_days
FROM Subscriptions;

-- Task5 --

CREATE TABLE AppLogins (
    user_id INT PRIMARY KEY,
    last_login_date DATETIME
);

INSERT INTO AppLogins VALUES
(101, '2026-09-01 10:00:00'),
(102, '2026-10-20 12:30:00'),
(103, '2026-08-15 09:15:00'),
(104, '2026-10-01 14:00:00'),
(105, '2026-10-25 18:00:00');

SELECT
    user_id,
    last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;
-- Task1 --

CREATE DATABASE RestaurantDB;
USE RestaurantDB;

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE RestaurantReviews (
    review_id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

INSERT INTO Restaurants VALUES
(1, 'Food Palace', 'Ahmedabad'),
(2, 'Spice Garden', 'Surat'),
(3, 'Pizza House', 'Ahmedabad'),
(4, 'Tasty Bites', 'Vadodara');

INSERT INTO RestaurantReviews VALUES
(1, 1, 4.5),
(2, 1, 4.8),
(3, 1, 4.2),
(4, 2, 3.5),
(5, 2, 4.0),
(6, 3, 4.7),
(7, 3, 4.9),
(8, 4, 3.2);

CREATE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    AVG(rv.rating) AS average_rating,
    COUNT(rv.review_id) AS total_reviews
FROM Restaurants r
INNER JOIN RestaurantReviews rv
    ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.restaurant_name
HAVING AVG(rv.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- Task2--

CREATE OR REPLACE VIEW TopRatedRestaurants AS
SELECT
    r.restaurant_name,
    r.city,
    AVG(rv.rating) AS average_rating,
    COUNT(rv.review_id) AS total_reviews
FROM Restaurants r
INNER JOIN RestaurantReviews rv
    ON r.restaurant_id = rv.restaurant_id
GROUP BY
    r.restaurant_id,
    r.restaurant_name,
    r.city
HAVING AVG(rv.rating) > 4.0;

SELECT * FROM TopRatedRestaurants;

-- Task3 --

UPDATE TopRatedRestaurants
SET average_rating = 5.0
WHERE restaurant_name = 'Food Palace';

-- Task4 --

CREATE DATABASE SwiggyDB;
USE SwiggyDB;

CREATE TABLE SwiggyOrders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO SwiggyOrders VALUES
(1, CURDATE(), 250.00),
(2, CURDATE(), 350.00),
(3, DATE_SUB(CURDATE(), INTERVAL 1 DAY), 500.00),
(4, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 200.00),
(5, DATE_SUB(CURDATE(), INTERVAL 2 DAY), 450.00),
(6, DATE_SUB(CURDATE(), INTERVAL 10 DAY), 700.00),
(7, DATE_SUB(CURDATE(), INTERVAL 35 DAY), 300.00);

CREATE VIEW DailyOrderSummary AS
SELECT
    order_date,
    COUNT(order_id) AS total_orders,
    SUM(total_amount) AS total_revenue
FROM SwiggyOrders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
  AND order_date <= CURDATE()
GROUP BY order_date;

SELECT * FROM DailyOrderSummary
ORDER BY order_date DESC;

-- Task5 --

CREATE DATABASE IF NOT EXISTS FlipkartDB;
USE FlipkartDB;

CREATE TABLE IF NOT EXISTS FlipkartSales (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO FlipkartSales
(order_id, product_id, quantity, price, order_date)
VALUES
(1, 101, 2, 500, CURDATE()),
(2, 102, 3, 300, CURDATE()),
(3, 101, 1, 500, DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
(4, 103, 2, 1000, DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
(5, 102, 4, 300, DATE_SUB(CURDATE(), INTERVAL 40 DAY));

CREATE OR REPLACE VIEW FlipkartSalesSummary AS
SELECT
    product_id,
    SUM(quantity) AS total_quantity_sold
FROM FlipkartSales
GROUP BY product_id;

SELECT * FROM FlipkartSalesSummary;


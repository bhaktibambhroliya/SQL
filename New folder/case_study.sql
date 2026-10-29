-- Task1 --

SHOW DATABASES;

USE RestaurantDB;

SHOW TABLES;

CREATE TABLE zomato (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    cuisines VARCHAR(255),
    rate DECIMAL(3,1),
    votes INT,
    approx_cost INT,
    rest_type VARCHAR(100)
);

DESCRIBE zomato;

SHOW TABLES;

-- Task2 --

SELECT
    cuisines,
    COUNT(*) AS restaurant_count
FROM zomato
WHERE location = 'Indiranagar'
  AND cuisines IS NOT NULL
GROUP BY cuisines
ORDER BY restaurant_count DESC;

-- Task3 --

SELECT
    rest_type,
    ROUND(AVG(approx_cost), 2) AS average_cost_for_two
FROM zomato
WHERE rest_type IS NOT NULL
  AND approx_cost IS NOT NULL
GROUP BY rest_type
ORDER BY average_cost_for_two DESC;

-- Task4 --

SELECT
    name,
    location,
    rate,
    votes,
    approx_cost,
    rest_type
FROM zomato
WHERE rate < 3.0
  AND votes > 200
ORDER BY votes DESC;

-- Task5 --

SELECT
    name,
    location,
    approx_cost,
    CASE
        WHEN approx_cost < 500 THEN 'Budget'
        WHEN approx_cost BETWEEN 500 AND 1500 THEN 'Mid-range'
        WHEN approx_cost > 1500 THEN 'Premium'
        ELSE 'Unknown'
    END AS market_category
FROM zomato
ORDER BY approx_cost ASC;
-- Task1 --

SHOW DATABASES;
USE music_streaming_db;
SHOW TABLES;

CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    location VARCHAR(100)
);

INSERT INTO restaurants (name, rating, location)
VALUES
('Pizza Hut', 4.2, 'Ahmedabad'),
('Dominos', 4.5, 'Surat'),
('McDonalds', 4.0, 'Rajkot');

SELECT * FROM restaurants;

-- Task2 --

USE music_streaming_db;
SHOW TABLES;

CREATE TABLE zomato_reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    rating DECIMAL(2,1)
);

INSERT INTO zomato_reviews (name, rating)
VALUES
('Pizza Hut', 4.2),
('Dominos', 4.5),
('McDonalds', 4.0);

SELECT name, rating
FROM zomato_reviews;

-- Task3 --

create database movie_db;
use movie_db;

create table movies(
	movie_id int primary key auto_increment,
    movie_name varchar(100),
    release_year int
);

insert into movies(movie_name, release_year)
	values('Dangal', 2016),
		('3 Idiots', 2009),
		('Pathaan', 2023),
		('Jawan', 2023),
		('Chennai Express', 2013);
        
select * from movies;

select
	movie_name as "title",
    release_year as "released"
from movies;

-- task4 --

create table products(
	product_id int primary key auto_increment,
    product_name varchar(100),
    price decimal(10,2),
    quntity int
);

insert into products (product_name, price, quntity)
	values("laptop", 45000.00, 10),
			("mobile", 15000.00, 20),
            ("headphone", 1200.00, 30),
            ("keyboard", 800.00, 15),
            ("mouse", 500.00, 25);
            
select * from products;



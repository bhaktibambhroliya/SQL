use tops;

-- Task1 --
create table if not exists resturants(
	id int primary key auto_increment,
    name varchar(100),
    rating decimal(2, 1)
);

insert into resturants (name, rating)
values("dominos", 4.5),
		("pizza hut", 4.2),
        ("mcdonald", 4.7),
        ("subway", 4.0),
        ("burger king", 4.8);
        
select * from resturants
where rating >= 4.5;

-- Task2 --

create table if not exists movies(
	id int primary key auto_increment,
    movie_name varchar(100),
    release_year int,
    genre varchar(50)
    );
    
insert into movies (movie_name, release_year, genre)
values('Pathaan', 2023, 'Action'),
('Jawan', 2023, 'Action'),
('Dangal', 2016, 'Action'),
('Dune', 2021, 'Sci-Fi'),
('War', 2019, 'Action'),
('Fighter', 2024, 'Action');

select * from movies
where release_year > 2020
and genre = "Action";

-- Task3 -- 

create table if not exists products(
	id int primary key auto_increment,
    name varchar(100),
    price decimal(10, 2),
    category varchar(50)
);

insert into products(name, price, category)
values('Laptop', 45000, 'Electronics'),
('Mouse', 400, 'Electronics'),
('Chair', 1500, 'Furniture'),
('Pen', 20, 'Stationery'),
('Mobile', 15000, 'Electronics'),
('Table', 300, 'Furniture');

SELECT *
FROM products
WHERE category != 'Electronics'
OR price < 500;

-- task4--

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    city VARCHAR(100),
    followers INT
);

INSERT INTO users (name, city, followers)
VALUES
('Rahul', 'Ahmedabad', 1500),
('Priya', 'Surat', 2000),
('Amit', 'Rajkot', 800),
('Neha', 'Vadodara', 2500),
('Riya', 'Ahmedabad', 3000),
('Karan', 'Surat', 1200);
		
SELECT * FROM users
WHERE NOT (city = 'Ahmedabad')
AND followers > 1000;
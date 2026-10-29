use tops;

-- Task1 --

create database if not exists sql_assignment;

create table if not exists restauraants(
	id int primary key auto_increment,
    name varchar(100),
    rating decimal(2, 1)
);

insert into restauraants(name, rating)
values("honest", 4.5),
("royal cafe", 4.2),
("green leaf cafe", 4.0),
("real peprika", 4.3);

select * from restauraants
WHERE name LIKE '%Cafe';

-- Task2 --

create table if not exists products1(
	id int primary key auto_increment,
    product_name varchar(100),
    price decimal(10, 2)
);

insert into products1(product_name, price)
values("laptop", 25000),
("smart phone", 15000),
("smart watch", 10000),
("tv", 300000),
("keyboard", 800);

select * from products1
where price between 500 and 15000;

-- Task3 --

use tops;

create table if not exists users1(
	id int primary key auto_increment,
    name varchar(100),
    city varchar(100)
);

insert into users1(name, city)
values("raj", "ahmedabad"),
("shruti", "rajkot"),
("nisha", "surat"),
("riya", "jetpur"),
("karan", "vadodara"),
("parth", "surat");

select * from users1
where city in ("ahmedabad", "rajkot", "surat");

-- task4-- 

create table if not exists songs(
	id int primary key auto_increment,
    song_name varchar(100),
    artist_name varchar(100)
);

insert into songs (song_name, artist_name)
values
('Tum Hi Ho', 'Arijit Singh'),
('Shape of You', 'Ed Sheeran'),
('Kesariya', 'Arijit Singh'),
('Love Story', 'Taylor Swift'),
('Perfect', 'Charlie Puth'),
('Believer', 'Imagine Dragons');

select * from songs
where artist_name like "ar";


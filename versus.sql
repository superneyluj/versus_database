-- création de la base de donnée de versus v1.0

create database versus;
use versus; 
create table utilisateur(
id int primary key,
user_name varchar(30),
user_first_name varchar(30),
gender char(1) check (gender like 'm' or gender like 'f'),
email_addr varchar(50),
date_of_birth date,
user_login varchar(255),
user_password varchar(255),
country varchar(255)
);

create table platform(
id int primary key,
name varchar(255),
price decimal
);

create table movie(
id int primary key,
name varchar(255),
duration time,
realisator_name varchar(255),
realisator_first_name varchar(255),
synopsis varchar(255),
category varchar(255)
);

create table tv_show(
id int primary key,
name varchar(255),
duration time,
realisator_name varchar(255),
realisator_first_name varchar(255),
synopsis varchar(255),
category varchar(255)
);

create table actor(
id int primary key,
name varchar(255),
first_name varchar(255),
age int check (age < 130),
gender char(1) enum('m','f'),
nationality varchar(255)
);

create table subscription(
id int primary key,
id_platform int,
id_user int,
date date,
payment_type varchar(1) enum ('cb','paypal','mastercard','visa','american express')
);

create table movie_viewing(
id int primary key,
id_movie int,
id_user int,
duration time,
starting_time time,
device varchar(255),
rate int check (rate < 10),
device varchar(255)
);

create table tv_show_viewing(
id int primary key,
id_tv_show int,
id_user int,
duration time,
starting_time time,
device varchar(255),
rate int check (rate < 10),
season_number int,
epsiode_number int
);

create table movie_disponibility(
id int primary key,
id_movie int,
id_platform int
);

create table tv_show_disponibility(
id int primary key,
id_tv_show int,
id_platform int
);

create table play_in_movie(
id int primary key,
id_movie int,
id_platform int
);

create table play_in_tv_show(
id int primary key,
id_tv_show int,
id_platform int
);



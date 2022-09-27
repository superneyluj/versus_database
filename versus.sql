-- création de la base de donnée de versus v1.0
drop database versus;
create database versus;
use versus; 

create table utilisateur(
id int,
user_name varchar(30),
user_first_name varchar(30),
gender ENUM('M','F'),
email_addr varchar(50),
date_of_birth date,
user_login varchar(255),
user_password varchar(255),
country varchar(255),
primary key (id)
);


create table platform(
id int,
name varchar(255),
price decimal(4,2),
primary key(id)
);

create table movie(
id int,
name varchar(255),
duration time,
realisator_name varchar(255),
realisator_first_name varchar(255),
synopsis varchar(255),
category varchar(255),
primary key (id)
);

create table tv_show(
id int ,
name varchar(255),
realisator_name varchar(255),
realisator_first_name varchar(255),
synopsis varchar(255),
category varchar(255),
primary key (id)
);

create table actor(
id int,
name varchar(255),
first_name varchar(255),
age varchar(3),
gender char(1),
nationality varchar(255),
primary key (id)
);

   
create table subscription(
id int,
id_platform int,
id_user int,
subscription_date datetime,
payment_type varchar(30),
primary key (id),
foreign key (id_platform) references platform(id),
foreign key (id_user) references utilisateur(id)
);

create table movie_viewing(
id int,
id_movie int,
id_user int,
duration time,
starting_time datetime,
device varchar(255),
rate int,
primary key (id),
foreign key (id_movie) references movie(id),
foreign key (id_user) references utilisateur(id)
);

create table tv_show_viewing(
id int,
id_tv_show int,
id_user int,
duration time,
starting_time datetime,
device varchar(255),
rate int,
season_number int,
epsiode_number int,
primary key (id),
foreign key (id_tv_show) references tv_show(id),
foreign key (id_user) references utilisateur(id)
);

create table movie_disponibility(
id int,
id_movie int,
id_platform int,
primary key (id),
foreign key (id_movie) references movie (id),
foreign key (id_platform) references platform(id)
);

create table tv_show_disponibility(
id int,
id_tv_show int,
id_platform int,
primary key (id),
foreign key(id_tv_show) references tv_show(id),
foreign key (id_platform) references platform(id)
);

create table play_in_movie(
id int,
id_movie int,
id_actor int,
primary key (id),
foreign key (id_movie) references movie(id),
foreign key (id_actor) references actor(id)
);

create table play_in_tv_show(
id int,
id_tv_show int,
id_actor int,
primary key (id),
foreign key (id_tv_show) references tv_show(id),
foreign key (id_actor) references actor(id)
);

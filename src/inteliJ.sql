create table universe
(
    id   serial primary key,
    name varchar(50) not null
);
insert into universe(name)
values ('Universe');

select *
from universe;

create table galaxy
(
    id   serial primary key,
    name varchar(50) not null
);

insert into galaxy(name)
values ('Milky Way'),
       ('Large Megalanic Cloud '),
       ('Small Megalanic Cloud'),
       ('Andormeda Galaxy'),
       ('Triangulum'),
       ('Cintaurus');

create table star_systems
(
    id           serial primary key,
    name         varchar(50) not null,
    id_of_galaxy int references galaxy (id)
);

insert into star_systems(name, id_of_galaxy)
values ('Solar System', 1),
       ('Alpha Centauti', 1),
       ('Sirius', 1),
       ('Sygni', 1);

create table planet
(
    id                 serial primary key,
    name               varchar unique,
    size               int not null,
    id_of_star_systems int references star_systems (id)
);

insert into planet(name, size, id_of_star_systems)
values ('(Mercury', 4879, 1),
       ('Venus', 12104, 1),
       (' Earth', 12742, 1),
       (' Mars', 6779, 1),
       (' Jupiter', 139822, 1),
       (' Saturn', 116460, 1),
       (' Uranus', 50724, 1),
       (' Neptune', 49244, 1);


create table earth
(
    id           serial unique primary key,
    continent    varchar(50) not null,
    id_of_planet int references planet (id)
);

insert into earth(continent, id_of_planet)
values ('Asia', 3),
       ('Africa', 3),
       ('North America', 3),
       ('South America', 3),
       ('Antatctica', 3),
       ('Europe', 3),
       ('Australia', 3);

create table coutry
(
    id              serial primary key,
    name_of_coutry  varchar(50) not null,
    id_of_continent int references earth (id)
);

insert into coutry(name_of_coutry, id_of_continent)
values ('Chine', 1),
       ('North Korea', 1),
       ('Kyrgyzstan', 1),
       ('Japon', 1),
       ('Uzbekistan', 1),
       ('South Korea', 1);

create table regions
(
    id             serial primary key,
    name_of_regins varchar(50) not null,
    population     int,
    id_of_country  int references coutry (id)
);

insert into regions (name_of_regins, population, id_of_country)
values ('Batken', 150000, 3),
       ('Osh', 1300000, 3),
       ('Jalal-Abad', 300000, 3),
       ('Talas', 4900000, 3),
       ('Naryn', 1900000, 3),
       ('Chyi', 122222, 3),
       ('Ysyk-Kol', 340000, 3);

create table area
(
    id            serial primary key,
    name_of_area  varchar(50) not null,
    poulation     int,
    id_of_regions int references regions (id)
);

insert into area(name_of_area, poulation, id_of_regions)
values ('Batken', 200000, 1),
       ('KadamJai', 200000, 1),
       ('Leilek', 200000, 1);

create table village
(
    id            serial primary key,
    name_of_area  varchar(50) not null,
    poulation     int,
    id_of_regions int references area (id)
);

insert into village(name_of_area, poulation, id_of_regions)
values ('Samarkandek', 29000, 1),
       ('Aktatyr', 29000, 1),
       ('Ravat', 29000, 1),
       ('Ych-dobo', 29000, 1);

select * from village;


















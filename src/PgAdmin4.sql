create table shops(id serial primary key,
                   name varchar(50)not null,
                   adress varchar unique);

insert into shops(name,adress)
values('Globus','prospect Mira'),
      ('Dostor','prospect Chyi'),
      ('Frunze','kievskyi');

create table products (id serial primary key,
                       name varchar(50)not null,price int,id_of_shop int references  shops(id));

insert into products(name,price,id_of_shop)
values('apple',50,1),
      ('milk',70,1),
      ('bread',35,1),
      ('oil',135,1),
      ('banana',150,1);



create table salesman(id serial primary key,
                      name varchar(50)not null,
                      id_of_shop int references shops(id)
);

insert into salesman(name,id_of_shop)
values('John Newman',1),
      ('Bob  Pooper',1),
      ('James Bond',1);



create table client(id serial primary key,
                    name varchar(50)not null,
                    id_of_shop int references shops(id),
                    id_of_salesman int  references salesman (id),
                    id_of_product int  references products (id));

insert into client (name,id_of_shop,id_of_salesman,id_of_product)
values('Cristiona Ronaldo',1,1,1),
      ('James ',2,3,2),
      ('Bob',1,2,3),
      ('Somanda',1,2,3);



create table neighborhood(id serial primary key,
                          name varchar (50)not null,
                          papulation int ,id_of_shops int references shops (id));

insert into neighborhood (name,papulation,id_of_shops)
values('Jal',35000,2),
      ('11 mkr',13000,3),
      ('6 mkr',23000,1),
      ('4 mkr',10000,2);



create table districts (id serial primary key,name varchar(50)not null,
                        population int,id_of_neighborhood int  references  neighborhood(id));


insert into districts (name,population,id_of_neighborhood)
values('1-may',300000,1),
      ('Lenin',120000,2),
      ('Sverdlov',140000,2),
      ('Octiybrskyi',150000,3);

create table capital( id serial primary key,name varchar(50)not null,
                      populations int,
                      id_of_districts1 int  references  districts(id),
                      id_of_districts2 int  references  districts(id),
                      id_of_districts3 int  references  districts(id),
                      id_of_districts4 int  references  districts(id));




insert into capital (name,populations,id_of_districts1,
                     id_of_districts2,
                     id_of_districts3,
                     id_of_districts4)
values('Bishkek',1500000,1,2,3,4);





create table country(id serial primary key,name varchar(50)not null,
                     population int ,
                     id_of_capital int references capital(id));


insert into country(name,population,id_of_capital)
values('Kyrgyzstan',7000000,1);



create table region(id serial primary key,name varchar(50)not null,
                    population int ,
                    id_of_coutry int references coutry(id));


insert into region(name,population, id_of_coutry)
values('Batken',290000,1),
      ('Osh',390000,1),
      ('Jalal-Abad',450000,1),
      ('Naryn',290000,1),
      ('Talas',330000,1),
      ('Chyi',670000,1),
      ('Ysyk-Kol',120000,1);

select * from region ;

create table areas(id serial primary key,name varchar(50)not null,
                   population int ,
                   id_of_regions int references regions(id));


insert into areas(name,population, id_of_regions)
values('Batken',290000,1);


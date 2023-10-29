create table hotels
(
    id          int primary key generated by default as identity,
    name        varchar(100) not null,
    address     varchar      not null,
    rating      int check ( rating >= 0 and hotels.rating <= 5 ),
    description varchar
);

insert into hotels(name, address, rating, description)
VALUES ('Zemlanka', 'St.Petersburg', 5, 'Best hotel in the world');

insert into hotels(name, address, rating, description)
VALUES ('Yma', 'Lilte Petranka 19', 2, 'it is scary to me');

insert into hotels(name, address, rating, description)
VALUES ('MoscowCity', 'Moscow', 5, 'it is vary large');


create table rooms
(
    id           bigint primary key generated by default as identity,
    room_number  int              not null unique ,
    room_size    double precision not null check ( room_size > 0 ),
    is_available boolean DEFAULT true,
    id_hotel int references hotels (id) on delete cascade not null
);


insert into rooms(room_number, room_size, id_hotel) VALUES (101, 14.4, 1);
insert into rooms(room_number, room_size, id_hotel) VALUES (102, 24.4, 1);
insert into rooms(room_number, room_size, id_hotel) VALUES (103, 32, 1);

insert into rooms(room_number, room_size, id_hotel) VALUES (21, 10, 2);
insert into rooms(room_number, room_size, id_hotel) VALUES (22, 30, 2);
insert into rooms(room_number, room_size, id_hotel) VALUES (33, 30, 2);

insert into rooms(room_number, room_size, id_hotel) VALUES (1001, 20, 3);
insert into rooms(room_number, room_size, id_hotel) VALUES (1002, 22.3, 3);
insert into rooms(room_number, room_size, id_hotel) VALUES (1003, 99, 3);




CREATE table clients (
    id int primary key generated by default as identity ,
    name varchar(100) not null ,
    login varchar(100) not null unique ,
    password varchar not null,
    birthdate date not null
);

insert into clients(name, login, password, birthdate) VALUES ('Dorn', 'dorn51', '123456', '2000-01-01');
insert into clients(name, login, password, birthdate) VALUES ('Leon', 'kalibanforever', '123456', '1993-04-05');
insert into clients(name, login, password, birthdate) VALUES ('Jiliman', 'utlra', '123456', '1953-11-11');


-- отсутствую колонки для связи с владеющий стороной (клиент и отель)
CREATE table Reviews (
    id int primary key generated by default as identity ,
    rating int not null check ( rating >= 0 and rating <= 5),
    date date not null default current_date
);


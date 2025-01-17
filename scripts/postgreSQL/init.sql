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
    room_number  int                                          not null unique,
    room_size    double precision                             not null check ( room_size > 0 ),
    is_available boolean DEFAULT true,
    id_hotel     int references hotels (id) on delete cascade not null
);


insert into rooms(room_number, room_size, id_hotel)
VALUES (101, 14.4, 1);
insert into rooms(room_number, room_size, id_hotel)
VALUES (102, 24.4, 1);
insert into rooms(room_number, room_size, id_hotel)
VALUES (103, 32, 1);

insert into rooms(room_number, room_size, id_hotel)
VALUES (21, 10, 2);
insert into rooms(room_number, room_size, id_hotel)
VALUES (22, 30, 2);
insert into rooms(room_number, room_size, id_hotel)
VALUES (33, 30, 2);

insert into rooms(room_number, room_size, id_hotel)
VALUES (1001, 20, 3);
insert into rooms(room_number, room_size, id_hotel)
VALUES (1002, 22.3, 3);
insert into rooms(room_number, room_size, id_hotel)
VALUES (1003, 99, 3);



CREATE table clients
(
    id        int primary key generated by default as identity,
    name      varchar(100) not null,
    login     varchar(100) not null unique,
    password  varchar      not null,
    birthdate date         not null
);


insert into clients(name, login, password, birthdate)
VALUES ('Dorn', 'dorn51', '$2a$10$.ulgt.FpWssjM0R6S1BCPOt8vsPt5icsIjNeUQ1FXK47Po25/oqjG', '2000-01-01');
insert into clients(name, login, password, birthdate)
VALUES ('Leon', 'kalibanforever', '$2a$10$.ulgt.FpWssjM0R6S1BCPOt8vsPt5icsIjNeUQ1FXK47Po25/oqjG', '1993-04-05');
insert into clients(name, login, password, birthdate)
VALUES ('Jiliman', 'utlra', '$2a$10$.ulgt.FpWssjM0R6S1BCPOt8vsPt5icsIjNeUQ1FXK47Po25/oqjG', '1953-11-11');


CREATE table users_role
(
    id        int primary key generated by default as identity,
    id_client int references clients (id) on DELETE cascade not null,
    roles      varchar(50)                                   not null default ('GUEST')

);

insert into users_role(id_client, roles)
VALUES (1, 'ADMIN');
insert into users_role(id_client, roles)
VALUES (2, 'USER');
insert into users_role(id_client, roles)
VALUES (3, 'USER');


CREATE table Reviews
(
    id        int primary key generated by default as identity,
    rating    int                                           not null check ( rating >= 0 and rating <= 5),
    review    varchar(900),
    date      date                                          not null default current_date,
    id_client int references clients (id) on DELETE cascade not null,
    id_hotel  int references hotels (id) on DELETE cascade  not null
);

insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (3, 'С пивом потянет', '2019-04-08', 1, 1);
insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (4, 'Норм место', '2019-04-08', 1, 2);
insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (5, 'Как греческие боги отдохнул', '2022-04-08', 2, 3);
insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (5, 'Шикарный отель', '2022-04-08', 2, 2);
insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (3, 'Ночь переспать на тройку понтянет', '2023-07-11', 3, 2);
insert into reviews(rating, review, date, id_client, id_hotel)
VALUES (3, 'Не съели и на том спасибо', '2023-07-11', 3, 2);



CREATE table Books
(
    id        int primary key generated by default as identity,
    check_in  DATE check ( check_in >= current_date )   not null,
    check_out DATE check ( check_out > Books.check_in ) not null,
    id_client int                                       not null references clients (id) on delete cascade,
    id_room   int                                       not null references rooms (id) on delete cascade
);

insert into Books (check_in, check_out, id_client, id_room)
VALUES (current_date, current_date + 5, 1, 1);
insert into Books (check_in, check_out, id_client, id_room)
VALUES (current_date + 10, current_date + 25, 1, 2);

insert into Books (check_in, check_out, id_client, id_room)
VALUES (current_date, current_date + 30, 2, 3);
insert into Books (check_in, check_out, id_client, id_room)
VALUES (current_date + 40, current_date + 60, 2, 2);

insert into Books (check_in, check_out, id_client, id_room)
VALUES (current_date, current_date + 90, 3, 2);


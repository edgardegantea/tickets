create database tickets;

use tickets;

CREATE TABLE areas
(
    id          int(12)      NOT NULL AUTO_INCREMENT,
    name        varchar(150) NOT NULL,
    description varchar(255)          DEFAULT NULL,
    phone       varchar(20)           DEFAULT NULL,
    email       varchar(80)           DEFAULT NULL,
    active      tinyint(1)   NOT NULL DEFAULT 1,
    created_at  datetime              DEFAULT current_timestamp(),
    updated_at  datetime              DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    primary key (id)
);



CREATE TABLE categories
(
    id          int(12)      NOT NULL AUTO_INCREMENT,
    name        varchar(150) NOT NULL,
    slug        varchar(150) NOT NULL,
    description text     DEFAULT NULL,
    updated_at  datetime     NOT NULL,
    created_at  datetime DEFAULT NULL,
    primary key (id)
);



CREATE TABLE priorities
(
    id         varchar(11) NOT NULL,
    name       varchar(50) NOT NULL,
    slug       varchar(50) NOT NULL,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    deleted_at datetime DEFAULT NULL,
    primary key (id)
);


CREATE TABLE status
(
    id         varchar(5)  NOT NULL,
    name       varchar(20) NOT NULL,
    created_at datetime    NOT NULL,
    updated_at datetime DEFAULT NULL,
    primary key (id)
);

-- drop table users;
CREATE TABLE users
(
    id         int(11)  NOT NULL AUTO_INCREMENT,
    name       varchar(80)      NOT NULL,
    apaterno   varchar(80)      NOT NULL,
    amaterno   varchar(80)      NOT NULL,
    email      varchar(100)     NOT NULL,
    phone_no   varchar(20)      NOT NULL,
    role       varchar(20)      NOT NULL,
    password   varchar(255)     NOT NULL,
    area       int(12) NOT NULL,
    image      varchar(255)     null,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    deleted_at datetime DEFAULT NULL,
    primary key (id),
    foreign key (area) references areas (id)

);


-- drop table tickets;

CREATE TABLE tickets
(
    id          int(11) NOT NULL auto_increment,
    usuario     int(11) NOT NULL,
    category    int(12) NOT NULL,
    priority    varchar(11)       NOT NULL,
    title       varchar(150)     NOT NULL,
    slug        varchar(150)     NOT NULL,
    description text             NOT NULL,
    url         varchar(255) DEFAULT NULL,
    status      varchar(5) not null ,
    phone       varchar(15)  DEFAULT NULL,
    email       varchar(80)  DEFAULT NULL,
    file_name   varchar(255) null,
    remote      varchar(50)  DEFAULT NULL,
    dateMeeting datetime     DEFAULT NULL,
    hourMeeting time         DEFAULT NULL,
    ok          tinyint(1)   DEFAULT NULL,
    created_at  datetime     DEFAULT NULL,
    updated_at  datetime     DEFAULT NULL,
    deleted_at  datetime     DEFAULT NULL,
    primary key (id),
    foreign key (usuario) references users(id),
    foreign key (category) references categories(id),
    foreign key (priority) references priorities(id),
    foreign key (status) references status(id)
);


CREATE TABLE bitacoras
(
    id         int(11) NOT NULL auto_increment,
    ticket     int(11) NOT NULL,
    mensaje    varchar(255)     NOT NULL,
    created_at datetime DEFAULT NULL,
    updated_at datetime DEFAULT NULL,
    deleted_at datetime DEFAULT NULL,
    primary key (id),
    foreign key (ticket) references tickets(id)
);

-- drop table attachments;

CREATE TABLE attachments
(
    id        int(11)      NOT NULL auto_increment,
    ticket_id  int(11)      NOT NULL,
    file_name varchar(255) NOT NULL,
    primary key (id),
    foreign key (ticket_id) references tickets(id)
);


CREATE TABLE mensajes
(
    id         int(11) NOT NULL auto_increment,
    ticket_id  int(11) NOT NULL,
    usuario_id int(11) NOT NULL,
    mensaje    text                      DEFAULT NULL,
    created_at timestamp        NOT NULL DEFAULT current_timestamp(),
    updated_at datetime                  DEFAULT NULL,
    deleted_at datetime                  DEFAULT NULL,
    primary key (id),
    foreign key (ticket_id) references tickets(id),
    foreign key (usuario_id) references users(id)
);
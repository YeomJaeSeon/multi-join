# main
create table if not exists main_tb (
    id int primary key auto_increment,
    name varchar(255) not null
);

insert into main_tb (name)
values ('main_tb_name1'),
       ('main_tb_name2'),
       ('main_tb_name3'),
       ('main_tb_name4'),
       ('main_tb_name5');


# sub1
create table if not exists sub1_tb1
(
    id         int primary key auto_increment,
    name       varchar(255) not null,
    main_tb_id int          not null,
    foreign key (main_tb_id) references main_tb (id)
);

create table if not exists sub1_tb2
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub1_tb1_id int          not null,
    foreign key (sub1_tb1_id) references sub1_tb1 (id)
);

create table if not exists sub1_tb3
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub1_tb2_id int          not null,
    foreign key (sub1_tb2_id) references sub1_tb2 (id)
);


# sub2
create table if not exists sub2_tb1(
    id int primary key auto_increment,
    name varchar(255) not null,
    main_tb_id int not null ,
    foreign key (main_tb_id) references main_tb (id)
);

create table if not exists sub2_tb2
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub2_tb1_id int          not null,
    foreign key (sub2_tb1_id) references sub2_tb1 (id)
);

create table if not exists sub2_tb3
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub2_tb2_id int          not null,
    foreign key (sub2_tb2_id) references sub2_tb2 (id)
);

# sub3
create table if not exists sub3_tb1(
    id int primary key auto_increment,
    name varchar(255) not null,
    main_tb_id int not null ,
    foreign key (main_tb_id) references main_tb (id)
);

create table if not exists sub3_tb2
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub3_tb1_id int          not null,
    foreign key (sub3_tb1_id) references sub3_tb1 (id)
);

create table if not exists sub3_tb3
(
    id          int primary key auto_increment,
    name        varchar(255) not null,
    sub3_tb2_id int          not null,
    foreign key (sub3_tb2_id) references sub3_tb2 (id)
);
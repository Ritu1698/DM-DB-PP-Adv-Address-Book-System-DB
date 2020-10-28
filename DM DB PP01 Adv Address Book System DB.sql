#UC1

create database address_book_service;
show databases;
use address_book_service;

#UC2

create table address_book(
    -> firstname varchar(50) not null,
    -> lastname varchar (50) not null,
    -> address varchar (150) not null,
    -> city varchar (50) not null,
    -> state varchar (50) not null,
    -> zip varchar(6) not null,
    -> number varchar(13) not null,
    -> email varchar(50) not null);
 desc address_book;

#UC3

insert into address_book(firstname, lastname, address, city, state, zip, number, email) values
    -> ('Ritu', 'Biswas', 'Orchid Apartments','Mumbai', 'Maharastra', '400088', '1234567890','bis@gmail.com'),
    -> ('Dyo', 'Das', 'p-19 house no. Lalkhuti','Medinapur', 'West Bengal', '700123', '4567890123','ddas@gmail.com'),
    -> ('Riya', 'Srivas', 'house no-22 abc apartments','Ranchi', 'Jharkhand', '834007', '7890123456','rs@gmail.com'),
    -> ('Tanu', 'Das', 'xyz flat no 513','Pune', 'Maharastra', '400099', '78901133','td@gmail.com');
select * from address_book;

#UC4

update address_book set city = 'kolkata' where firstname = 'Riya' or firstname = 'Dyo';
update address_book set state = 'West Bengal' where firstname = 'Riya';
select * from address_book;

#UC5

delete from address_book where firstname = 'Tanu';
select * from address_book;

#UC6

select * from address_book where city = 'Mumbai';
select * from address_book where state = 'West Bengal';

#UC7

select city, count(city) from address_book group by city;
select state, count(state) from address_book group by state;

#UC8

 select concat(firstname,' ',lastname) as name from address_book where city = 'kolkata' order by name;

#UC9

alter table address_book add name varchar(50) not null after email;
alter table address_book add type varchar(50) not null after name;
 select * from address_book;
 update address_book set name = 'otherstate', type = 'friends' where firstname = 'Dyo' or firstname = 'Riya';
 update address_book set name = 'homestate', type = 'family' where firstname = 'Ritu';
select * from address_book;

#UC10

select type, count(type) from address_book group by type;

#UC11

insert into address_book(firstname, lastname, address, city, state, zip, number, email, name, type) values
    -> ('Tanu', 'Das', 'xyz flat no 513','Pune', 'Maharastra', '400099', '78901133','td@gmail.com', 'homestate','friends'),
    -> ('Tanu', 'Das', 'xyz flat no 513','Pune', 'Maharastra', '400099', '78901133','td@gmail.com', 'homestate','family');
select * from address_book;
select type, count(type) from address_book group by type;

#UC12

create table contact
    -> (
    -> contact_id int not null auto_increment,
    -> first_name varchar(50) not null,
    -> last_name varchar(50) not null,
    -> address varchar(250) not null,
    -> city varchar(50) not null,
    -> state varchar(50) not null,
    -> zip varchar(7) not null,
    -> phone_number varchar(10) not null,
    -> email varchar(50) not null,
    -> primary key(contact_id)
    -> );
insert into contact(first_name,last_name,address,city,state,zip,phone_number,email) values
       -> ('Ritu', 'Biswas', 'Orchid Apartments','Mumbai', 'Maharastra', '400088', '1234567890','bis@gmail.com'),
       -> ('Dyo', 'Das', 'p-19 house no. Lalkhuti','Kolkata', 'West Bengal', '700123', '4567890123','ddas@gmail.com'),
       -> ('Riya', 'Srivas', 'house no-22 abc apartments','Kolkata', 'West Bengal', '734007', '7890123456','rs@gmail.com'),
       -> ('Tanu', 'Das', 'xyz flat no 513','Pune', 'Maharastra', '400099', '78901133','td@gmail.com');
select * from contact;
create table address_book
    -> (
    -> address_book_id int not null auto_increment,
    -> name varchar(150) not null,
    -> primary key(address_book_id)
    -> );
insert into address_book(name) values
    -> ('homestate'),('otherstate');
select * from address_book;
create table address_contact
    -> (
    -> address_book_id int not null references address_book(address_book_id),
    -> contact_id int not null references contact(contact_id),
    -> type varchar(50),
    -> );
insert into address_contact values
    -> (1,1,'family'),
    -> (2,2,'friend'),
    -> (2,2,'friend'),
    -> (2,3,'family'),
    -> (1,4,'friend'),
    -> (1,4,'family');
select * from address_contact;


#UC13

select contact.first_name from contact where city='Kolkata';
select city,count(city) from contact group by(city);
select * from contact where city='Kolkata' order by first_name;
select type,count(type) from address_contact group by (type);
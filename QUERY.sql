--create database
create database booking_football_system;

--create users table
create table Users(
  user_id int primary key,
  full_name varchar(50) not null,
  email varchar(100) unique not null,
  role varchar(20) check (role in ('Ticket Manager', 'Football Fan')) not null,
  phone_number varchar(20) 
)

--users data insert
 insert  into Users (user_id, full_name, email, role, phone_number)  values
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);



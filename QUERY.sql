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

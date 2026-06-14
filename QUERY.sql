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

--create matches table
create table Matches (
  match_id int primary key,
  fixture varchar(100) not null,
  tournament_category varchar(100) not null,
  base_ticket_price int check (base_ticket_price > 0) not null,
  match_status varchar(20) check (
    match_status in (
      'Available',
      'Selling Fast',
      'Sold Out',
      'Postponed'
    )
  ) not null
)


--matches data insert
insert into
  Matches (
    match_id,
    fixture,
    tournament_category,
    base_ticket_price,
    match_status
  )
values
  (
    101,
    'Real Madrid vs Barcelona',
    'Champions League',
    150.00,
    'Available'
  ),
  (
    102,
    'Man City vs Liverpool',
    'Premier League',
    120.00,
    'Selling Fast'
  ),
  (
    103,
    'Bayern Munich vs PSG',
    'Champions League',
    130.00,
    'Available'
  ),
  (
    104,
    'AC Milan vs Inter Milan',
    'Serie A',
    90.00,
    'Sold Out'
  ),
  (
    105,
    'Juventus vs Roma',
    'Serie A',
    80.00,
    'Available'
  );
--create booking table
create table Bookings (
  booking_id int primary key,
  user_id int references Users (user_id) ON delete cascade,
  match_id int references Matches (match_id) ON delete cascade,
  seat_number VARCHAR(10),
  payment_status VARCHAR(20) check (
    payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
  ),
  total_cost int not null check (total_cost > 0)
);

--bookings data insert
insert into Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) values
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);

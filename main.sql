-- creating database
create database Football_Ticket_Booking_System
-- create user table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(250) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    role VARCHAR(30) NOT NULL CHECK (role IN ('Ticket Manager', 'Football Fan')),
    phone_number VARCHAR(20)
);

-- create match table
CREATE TABLE matches (
    match_id SERIAL primary key,
    fixture VARCHAR(150) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price DECIMAL(10,2) NOT NULL CHECK (base_ticket_price >= 0),
    match_status VARCHAR(20) NOT NULL CHECK (
            match_status IN (
                'Available',
                'Selling Fast',
                'Sold Out',
                'Postponed'
            )
        )
        
);

-- create bookings table 
CREATE TABLE bookings (
    booking_id SERIAL primary key,
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(20) NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,

    CONSTRAINT bookings_user_fk
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT bookings_match_fk
        FOREIGN KEY (match_id)
        REFERENCES matches(match_id),

    CONSTRAINT bookings_cost_check
        CHECK (total_cost >= 0),

    CONSTRAINT bookings_payment_status_check
        CHECK (
            payment_status IN (
                'Pending',
                'Confirmed',
                'Cancelled',
                'Refunded'
            )
        )
);

-- insert users data
INSERT INTO Users (user_id, full_name, email, role, phone_number) VALUES
(1, 'Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
(2, 'Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
(3, 'Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
(4, 'Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL);
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
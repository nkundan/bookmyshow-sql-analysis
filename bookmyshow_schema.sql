CREATE DATABASE IF NOT EXISTS bookmyshow;
USE bookmyshow;

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS shows;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS venues;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    venue_type VARCHAR(30) NOT NULL,
    city VARCHAR(50) NOT NULL,
    area VARCHAR(50) NOT NULL,
    total_capacity INT NOT NULL,
    screens_or_halls INT NOT NULL
);

CREATE TABLE events (
    event_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(20) NOT NULL,
    language VARCHAR(20),
    genre VARCHAR(30),
    duration_mins INT,
    release_or_start_date DATE,
    critic_rating DECIMAL(2,1)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    area VARCHAR(50),
    signup_date DATE,
    membership_tier VARCHAR(20),
    preferred_category VARCHAR(20)
);

CREATE TABLE shows (
    show_id INT PRIMARY KEY,
    event_id INT NOT NULL,
    venue_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    base_price DECIMAL(8,2) NOT NULL,
    capacity INT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    show_id INT NOT NULL,
    booking_datetime DATETIME NOT NULL,
    seats_booked INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_mode VARCHAR(20) NOT NULL,
    booking_status VARCHAR(15) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);

CREATE TABLE ratings (
    rating_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    event_id INT NOT NULL,
    rating INT NOT NULL,
    review_date DATE,
    CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- Import in this exact order:
-- 1 venues.csv
-- 2 events.csv
-- 3 customers.csv
-- 4 shows.csv
-- 5 bookings.csv
-- 6 ratings.csv

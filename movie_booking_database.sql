-- ============================================
-- MOVIE BOOKING DATABASE
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS movie_booking_db;
USE movie_booking_db;



CREATE TABLE Movies (
    Movie_ID INT PRIMARY KEY AUTO_INCREMENT,
    Movie_Name VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Duration_Minutes INT,
    Release_Year INT
);



CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);


CREATE TABLE Theaters (
    Theater_ID INT PRIMARY KEY AUTO_INCREMENT,
    Theater_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);



CREATE TABLE Shows (
    Show_ID INT PRIMARY KEY AUTO_INCREMENT,
    Movie_ID INT NOT NULL,
    Theater_ID INT NOT NULL,
    Show_Date DATE NOT NULL,
    Show_Time TIME NOT NULL,
    Ticket_Price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (Movie_ID)
        REFERENCES Movies(Movie_ID),

    FOREIGN KEY (Theater_ID)
        REFERENCES Theaters(Theater_ID)
);


CREATE TABLE Bookings (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT NOT NULL,
    Show_ID INT NOT NULL,
    Seats_Booked INT NOT NULL,
    Booking_Date DATE NOT NULL,

    FOREIGN KEY (Customer_ID)
        REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Show_ID)
        REFERENCES Shows(Show_ID)
);



INSERT INTO Movies
(Movie_Name, Genre, Duration_Minutes, Release_Year)
VALUES
('Inception', 'Sci-Fi', 148, 2010),
('RRR', 'Action', 182, 2022),
('The Lion King', 'Animation', 118, 2019),
('Interstellar', 'Sci-Fi', 169, 2014),
('3 Idiots', 'Comedy', 170, 2009);


INSERT INTO Customers
(Customer_Name, Email, Phone)
VALUES
('Rahul Sharma', 'rahul@example.com', '9876543210'),
('Ananya Rao', 'ananya@example.com', '9876543211'),
('Vikram Kumar', 'vikram@example.com', '9876543212'),
('Priya Singh', 'priya@example.com', '9876543213'),
('Arjun Reddy', 'arjun@example.com', '9876543214');


INSERT INTO Theaters
(Theater_Name, Location)
VALUES
('PVR Cinemas', 'Madhapur'),
('INOX', 'Gachibowli'),
('AMB Cinemas', 'Kondapur');


INSERT INTO Shows
(Movie_ID, Theater_ID, Show_Date, Show_Time, Ticket_Price)
VALUES
(1, 1, '2026-10-01', '18:00:00', 250.00),
(2, 2, '2026-10-01', '19:00:00', 300.00),
(3, 3, '2026-10-02', '16:00:00', 200.00),
(4, 1, '2026-10-02', '20:00:00', 280.00),
(5, 2, '2026-10-03', '17:30:00', 220.00);


INSERT INTO Bookings
(Customer_ID, Show_ID, Seats_Booked, Booking_Date)
VALUES
(1, 1, 2, '2026-09-25'),
(2, 2, 3, '2026-09-25'),
(3, 3, 1, '2026-09-25'),
(4, 4, 2, '2026-09-25'),
(5, 5, 4, '2026-09-25');



SELECT * FROM Movies;
SELECT * FROM Customers;
SELECT * FROM Theaters;
SELECT * FROM Shows;
SELECT * FROM Bookings;

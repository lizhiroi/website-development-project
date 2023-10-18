DROP DATABASE IF EXISTS `airreservation`;

CREATE DATABASE IF NOT EXISTS airreservation DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `airreservation`;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS ar_user;
DROP TABLE IF EXISTS ar_person;
DROP TABLE IF EXISTS ar_flight;
DROP TABLE IF EXISTS ar_seat;
DROP TABLE IF EXISTS ar_airport;
DROP TABLE IF EXISTS ar_booking;
DROP TABLE IF EXISTS ar_ticket;
DROP TABLE IF EXISTS ar_discount;

CREATE TABLE ar_person (
    person_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    birthday DATE,
    gender VARCHAR(10),
    address VARCHAR(90)
);

INSERT INTO ar_person (person_id, first_name, last_name, birthday, gender, address)
VALUES
(1, "John", "Smith", "1980-01-15", "Male", "123 Main St, Toronto, ON"),
(2, "Alice", "Johnson", "1983-04-22", "Male", "456 Elm St, Vancouver, BC"),
(3, "Admin", "Admin", "1979-02-05", "Female", "789 Oak St, Montreal, QC"),
(4, "Robert", "White", "1986-10-18", "Male", "101 Pine St, Ottawa, ON"),
(5, "Emily", "Davis", "1981-09-30", "Female", "202 Cedar St, Calgary, AB"),
(6, "Olivia", "Brown", "1975-12-12", "Male", "303 Maple St, Edmonton, AB"),
(7, "Michael", "Lee", "1982-08-08", "Male", "404 Birch St, Halifax, NS"),
(8, "Emma", "Miller", "1977-06-25", "Female", "505 Spruce St, Winnipeg, MB"),
(9, "Sophia", "Young", "1989-04-03", "Female", "606 Fir St, Quebec City, QC"),
(10, "Daniel", "Hall", "1972-10-14", "Male", "707 Pine St, Regina, SK"),
(11, "Olivia", "Clark", "1987-12-29", "Male", "808 Elm St, Victoria, BC"),
(12, "James", "Turner", "1980-03-20", "Male", "909 Cedar St, St. John's, NL"),
(13, "Ava", "Ward", "1973-08-07", "Female", "010 Oak St, Yellowknife, NT"),
(14, "Benjamin", "Foster", "1985-10-11", "Male", "111 Pine St, Iqaluit, NU"),
(15, "Mia", "Gray", "1988-04-28", "Female", "212 Cedar St, Whitehorse, YT"),
(16, "William", "Bailey", "1971-11-02", "Male", "313 Elm St, Charlottetown, PE"),
(17, "Harper", "Cooper", "1981-06-19", "Male", "414 Maple St, Fredericton, NB"),
(18, "Evelyn", "Cox", "1974-04-15", "Male", "515 Birch St, Halifax, NS"),
(19, "Liam", "Richardson", "1989-09-08", "Male", "616 Spruce St, Winnipeg, MB"),
(20, "Amelia", "Brooks", "1978-12-23", "Male", "717 Fir St, Regina, SK"),
(21, "Ella", "Anderson", "2012-03-10", "Female", ""),
(22, "Noah", "Johnson", "2023-06-18", "X", ""),
(23, "Sophia", "Martinez", "2018-10-05", "Female", ""),
(24, "Liam", "Thompson", "2011-07-22", "Female", ""),
(25, "Olivia", "Davis", "2014-04-15", "Male", "");


CREATE TABLE ar_user (
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(30),
    password VARCHAR(30),
    email VARCHAR(30),
	phone VARCHAR(20),
    head_img VARCHAR(60),
    person_id INT,
    admin BOOLEAN,
    FOREIGN KEY (person_id) REFERENCES ar_person(person_id)
);

INSERT INTO ar_user (user_id, user_name, password, email, phone, head_img, person_id, admin)
VALUES 
(1, "SkyRider123", "pass123", "john.smith@email.com", "123-456-7892", "/avatar/img1.jpg", 1, FALSE),
(2, "TravelBuff88", "abc@123", "alice@email.com", "987-654-4321", "/avatar/img2.jpg", 2, FALSE),
(3, "admin", "admin123", "admin@email.com", "111-222-3333", "/avatar/img3.jpg", 3, TRUE),
(4, "GlobeTrotter99", "testpass", "robert@email.com", "444-555-6666", "/avatar/img4.jpg", 4, FALSE),
(5, "Wanderlust22", "secure1", "emily@email.com", "777-888-9999", "/avatar/img5.jpg", 5, FALSE),
(6, "NomadExplorer", "mypass", "olivia@email.com", "112-223-3344", "/avatar/img6.jpg", 6, FALSE),
(7, "AdventureSeeker55", "p123456", "michael@email.com", "223-334-4455", "/avatar/img7.jpg", 7, FALSE),
(8, "Voyager2023", "letmein", "emma@email.com", "334-445-5566", "/avatar/img8.jpg", 8, FALSE),
(9, "ExploreDreams", "welcome1", "sophia@email.com", "445-556-6677", "/avatar/img9.jpg", 9, FALSE),
(10, "FlightFreak44", "qwerty", "daniel@email.com", "556-667-7788", "/avatar/img10.jpg", 10, FALSE),
(11, "RoamingSpirit", "passpass", "olivia.c@email.com", "667-778-8899", "/avatar/img11.jpg", 11, FALSE),
(12, "InfiniteJourney", "football", "james@email.com", "778-889-9009", "/avatar/img12.jpg", 12, FALSE),
(13, "EternalWanderer", "baseball", "ava@email.com", "889-900-0111", "/avatar/img13.jpg", 13, FALSE),
(14, "SoaringHigh78", "password", "benjamin@email.com", "900-011-1221", "/avatar/img14.jpg", 14, FALSE),
(15, "OdysseyTraveler", "sunshine", "mia@email.com", "444-122-2333", "/avatar/img15.jpg", 15, FALSE),
(16, "HorizonChaser", "1234abcd", "william@email.com", "122-233-3445", "/avatar/img16.jpg", 16, FALSE),
(17, "InfiniteDestiny", "welcome2", "harper@email.com", "233-344-4552", "/avatar/img17.jpg", 17, FALSE),
(18, "JourneyEnthusiast", "abcdefgh", "evelyn@email.com", "344-455-5664", "/avatar/img18.jpg", 18, FALSE),
(19, "TravelEpicurean", "abc98765432", "liam@email.com", "455-566-6777", "/avatar/img19.jpg", 19, FALSE),
(20, "Expeditionist2023", "passpass", "amelia@email.com", "566-677-7887", "/avatar/img20.jpg", 20, FALSE);


CREATE TABLE ar_airport (
    airport_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    airport_code VARCHAR(10),
    airport_country VARCHAR(20),
    airport_name VARCHAR(20),
    location VARCHAR(20)
);

CREATE TABLE ar_flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    airline_name VARCHAR(20),
    departure_airport_id INT,
    arrival_airport_id INT,
    departure_date DATE,
    departure_time TIME,
    arrival_date DATE,
    arrival_time TIME,
    price_first DECIMAL(10, 2),
    price_business DECIMAL(10, 2),
    price_economy DECIMAL(10, 2),
    available_seats INT,
    FOREIGN KEY (departure_airport_id) REFERENCES ar_airport(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES ar_airport(airport_id)
);

CREATE TABLE ar_seat (
    seat_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    flight_id INT,
    seat_number VARCHAR(20),
    seat_class VARCHAR(20),
    person_id INT,
    FOREIGN KEY (flight_id) REFERENCES ar_flight(flight_id),
    FOREIGN KEY (person_id) REFERENCES ar_person(person_id)
);


CREATE TABLE ar_booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    booking_number VARCHAR(20),
	user_id INT,
	flight_id INT,
	booking_date DATE,
    booking_time TIME,
	total_price DECIMAL(10, 2),
	Status VARCHAR(20),
	FOREIGN KEY (user_id) REFERENCES ar_user(user_id),
    FOREIGN KEY (flight_id) REFERENCES ar_flight(flight_id)
);

CREATE TABLE ar_ticket (
	ticket_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	booking_id INT,
	person_id INT,
	seat_id INT,
	price DECIMAL(10, 2),
	checkin BOOLEAN,
	FOREIGN KEY (booking_id) REFERENCES ar_booking(booking_id),
    FOREIGN KEY (person_id) REFERENCES ar_person(person_id),
    FOREIGN KEY (seat_id) REFERENCES ar_seat(seat_id)
);

CREATE TABLE ar_discount (
	discount_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	adult DECIMAL(10, 2),
	children DECIMAL(10, 2),
	baby DECIMAL(10, 2),
	age_children INT,
	age_baby INT,
	reason1 VARCHAR(20),
	rate1 DECIMAL(10, 2),
	reason2 VARCHAR(20),
	rate2 DECIMAL(10, 2)
);



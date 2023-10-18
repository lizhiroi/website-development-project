# Initial Workflow Report
## AIRS'R'US Airline Reservation System

### Project Information 
**Project Name:** AIRS'R'US Airline Reservation System 
**Team Name:** Zulu 
**Team Members:** LI Zhi, FENG Xiaoli, BAO Qingjun,  
**Last Update Date:** 2023-10-18 
**Develop language:** html CSS PHP SQL
**Front-end Framework:** JQuery Bootstrap 
**Database:** MySQLi
**Develop IDE:** VS Code 

In the development of the AIRS'R'US Airline Reservation System, we have outlined the initial workflow which includes wireframes, designs, an Entity-Relationship (E/R) diagram, and a brief explanation of the research and design choices made for this project.

### Timeline
- 2023 Oct. 16 – Website Architecture Design, Product Requirement Document
- 2023 Oct. 18 – Initial Workflow: 
  - Wireframe UI Design, 
  - Database Identify Entities and Schema, 
  - ER-Diagram
- 2023 Oct. 23 – Miway Evaluation: 
  - Responsive UI design, 
  - PHP code, 
  - Database Schema and script
- 2022 Nov. 3 – Final Product: 
  - PHP programming and Testing
  - Entire website source files
  - Database import script
  - Written Documentation
  - Presentation



### Project Resources:

- github 
  - Main branch [https://github.com/lizhiroi/website-development-project](https://github.com/lizhiroi/website-development-project)
  - Bao, Qingjun branch [https://github.com/lizhiroi/website-development-project/tree/QingjunBAO](https://github.com/lizhiroi/website-development-project/tree/QingjunBAO)
  - Feng, Xiaoli branch [https://github.com/lizhiroi/website-development-project/tree/Xiaoli_Branch](https://github.com/lizhiroi/website-development-project/tree/Xiaoli_Branch)
  - Li, Zhi branch [https://github.com/lizhiroi/website-development-project/tree/ZhiLi_Branch](https://github.com/lizhiroi/website-development-project/tree/ZhiLi_Branch)

- Figma Design Tool
  - Team Zulu [https://www.figma.com/files/team/1294675049239031469/Zulu?fuid=1117226648776906502](https://www.figma.com/files/team/1294675049239031469/Zulu?fuid=1117226648776906502)


- Trello Kanban
  - [https://trello.com/b/v6dBjPPQ/airline-reservation](https://trello.com/b/v6dBjPPQ/airline-reservation)


### Wireframe / Design:
Our website's design is centered around the theme of a dark blue color scheme (#111F44), which aligns well with the topic of airline reservations, evoking a sense of trust and reliability. The font chosen for the website is "Inter," a Google Font specifically designed for computer screens, ensuring readability and a modern aesthetic.
Below, we have included wireframes that illustrate the layout and user interface elements of our website.

- Website Wireframe: [wireframe.zip](https://github.com/lizhiroi/website-development-project/blob/Xiaoli_Branch/Admin%2BRegis%2BSignIn.zip)

### E/R Diagram:
In the database design, we have implemented the system structure in 3rd Normal Form (3NF). The E/R diagram outlines the relationships between the entities and their attributes, ensuring data integrity and efficiency. Designing the database system for an Airline Reservation System involves creating a structure that can efficiently store, retrieve, and manage various data entities such as users, flights, airports, bookings, and more. 

- [ER_Airline_Reservation.png](https://github.com/lizhiroi/website-development-project/blob/QingjunBAO/ER_Airline_Reservation.png)


### Database Schema Design:

- User Entity: ***ar_user***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| UserID | INT | PK | Unique identifier for the user. |
| UserName | VARCHAR |  | User's registration name. |
| Email | VARCHAR |  | User's email address. |
| PasswordHash | VARCHAR |  | Hashed password for user authentication. |
| Phone | VARCHAR |  | User's phone number. |
| PersonID | INT | FK | References Person(PersonID) |
| Admin | BOOLEAN |  | Administer or not: false / true |


- Person Entity: ***ar_person***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| PersonID | INT | PK | Unique identifier for the person. |
| FName | VARCHAR |  | Person's first name |
| LName | VARCHAR |  | Person's last name |
| Birthday | DATE |  | Date of birth |
| Address | VARCHAR |  | Person's address. |
| Gender | VARCHAR |  | Person's gender |

- Flight Entity: ***ar_flight***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| FlightID | INT | PK | Unique identifier for the flight. |
| AirlineName | VARCHAR |  | Name of the airline operating the flight. |
| DepartureAirportID | INT | FK | References Airport(AirportID): Departure airport for the flight. |
| ArrivalAirportID | INT | FK | References Airport(AirportID): Arrival airport for the flight. |
| DepartureDate | DATE |  | Date of the flight's departure. |
| DepartureTime | TIME |  | Time of the flight's departure. |
| ArrivalDate | DATE |  | Date of the flight's arrival. |
| ArrivalTime | TIME |  | Time of the flight's arrival. |
| PriceFirst | DECIMAL |  | First Class Ticket price for the flight. |
| PriceBusiness | DECIMAL |  | Business Ticket price for the flight. |
| PriceEconomy | DECIMAL |  | Economy Ticket price for the flight. |
| AvailableSeats | INT |  | Number of available seats on the flight. |


- Flight Entity: ***ar_seat***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| SeatID | INT | PK | Unique identifier for the seat. |
| FlightID | INT | FK | Unique identifier for the flight |
| SeatNumber | VARCHAR |  | Number of this seat |
| SeatClass | VARCHAR |  | Class of seat: “First Class” / “Business” / “Economy” |
| PersonID | INT | FK | References Person(PersonID): the person who take this seat |


- Airport Entity: ***ar_airport***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| AirportID | INT | PK | Unique identifier for the airport. |
| AirportCode | VARCHAR |  | IATA code |
| AirportCountry | VARCHAR |  | Country of the airport. |
| AirportName | VARCHAR |  | Name of the airport. |
| Location | VARCHAR |  | Location or city where the airport is located. |


- Booking Entity: ***ar_booking***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| BookingID | INT | PK | Unique identifier for the booking order. |
| BookingNumber | VARCHAR |  | Unique number for the booking order. |
| UserID | INT | FK | References User(UserID): ID of the booking user. |
| FlightID | INT | FK | References Flight(FlightID): ID of the booked flight. |
| BookingDate | DATETIME |  | Date and time when the booking was made. |
| TotalPrice | DECIMAL |  | Total price paid for the booking. |
| Status | VARCHAR |  | Booking status (e.g., Confirmed, Pending, Cancelled, etc.). |


- Ticket Entity: ***ar_ticket***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| TicketID | INT | PK | Unique identifier for the ticket. |
| BookingID | INT | FK | References Booking(BookingID): ID of the booking order. |
| PersonID | INT | FK | References Person(PersonID): the person who take this seat |
| SeatID | INT | FK | References Seat(SeatID): The Seat Person selected |
| Price | DECIMAL |  | Price paid for the ticket. |
| Checkin | BOOLEAN |  | The ticket check-in information: false / true |


- Discount Entity: ***ar_discount***

| Field | Data Type | Key | Description |
|  ----  | ----  | ----  | ----  |
| DiscountID | INT | PK | Unique identifier for the ticket price discount. |
| Adult | DECIMAL |  | Discount for the Adult person / normal price |
| Children | DECIMAL |  | Discount for the Children person |
| Baby | DECIMAL |  | Discount for the Baby person |
| AgeChildren | INT |  | The age rules for the Children |
| AgeBaby | INT |  | The age rules for the Baby |
| Reason1 | VARCHAR |  | Reason 1 for discount |
| Rate1 | DECIMAL |  | Reason 1 discount rate |
| Reason2 | VARCHAR |  | Reason 2 for discount |
| Rate2 | DECIMAL |  | Reason 2 discount rate | 




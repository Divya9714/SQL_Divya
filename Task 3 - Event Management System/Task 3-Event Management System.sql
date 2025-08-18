
-------------------------------     #Task 3    ------------------------------------
			    	
                        #Project: Event Management System

-----------------------------------------------------------------------------------

#1. Database Creation
CREATE DATABASE EventsManagement;
USE EventsManagement;

---#Create tables for Events, Attendees, and Registrations------------

CREATE table Events(
Event_Id INT AUTO_INCREMENT PRIMARY KEY,
Event_Name varchar(50) NOT NULL,
Event_Date date NOT NULL,
Event_Location VARCHAR(150) NOT NULL,
Event_Description VARCHAR(500)
);

Create table Attendees(
Attendee_Id int PRIMARY KEY,
Attendee_Name varchar(20) NOT NULL,
Attendee_Phone VARCHAR(20),
Attendee_Email varchar(50) UNIQUE,
Attendee_City varchar(50)
);

Create table Registrations(
Registration_id INT PRIMARY KEY,
Event_Id int NOT NULL,
Attendee_Id int NOT NULL,
Registration_Date date NOT NULL,
Registration_Amount decimal(10,2),
FOREIGN KEY (Event_Id) REFERENCES Events(Event_Id) ON DELETE CASCADE,
FOREIGN KEY (Attendee_Id) REFERENCES Attendees(Attendee_Id)  ON DELETE CASCADE
);

----------------------#3. Manage Event Details------------------

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description) VALUES
('Samsung Pop up store', '2025-10-04', 'Noida', 'Join us at the Samsung Pop-up Store to experience the new Z Flip Series. Exciting demos and offers await!'),
('Amazon Offline Sale', '2025-10-12', 'Bangalore', 'Don’t miss the Amazon Offline Sale featuring a specially curated collection just for you. Come explore great deals and discounts!'),
('One Plus Store Sale', '2025-09-26', 'Hyderabad', 'Celebrate with us at the OnePlus Mega Sale!'),
('Starbucks Offer', '2025-09-01', 'Mumbai', 'Swing by Starbucks and enjoy exclusive seasonal offers on your favorite beverages.'),
('Apple Product Showcase', '2025-09-10', 'Chennai', 'Come experience the latest Apple innovations, hands-on demos, and exclusive early access to upcoming products.'),
('Flipkart Festive Deals', '2025-10-15', 'Pune', 'Kick off the festive season with massive discounts at the Flipkart Festive Deals event.'),
('Nykaa Beauty Carnival', '2025-09-20', 'Delhi', 'Explore the best of beauty at the Nykaa Carnival with live tutorials, free samples, and great offers await!'),
('Decathlon Fitness Expo', '2025-09-25', 'Ahmedabad', 'Join us for fitness workshops, gear testing, and exciting offers on Decathlon products all under one roof.');

INSERT INTO Attendees (Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City) VALUES
(11, 'Priyanka Singh', '9876543210', 'priyanka@email.com', 'Jaipur'),
(22, 'Diya Sharma', '5556667770', 'diya@email.com', 'Chennai'),
(33, 'Rachit Nayak', '9988776655', 'rachit@email.com', 'Odisha'),
(44, 'Siya Singh', '9887766554', 'siya@email.com', 'Delhi'),
(55, 'Ankit Vij', '9898989898', 'ankit@email.com', 'Bhopal'),
(66, 'Neha Verma', '9123456789', 'neha@email.com', 'Mumbai'),
(77, 'Aarti Kapoor', '9001122334', 'aarti@email.com', 'Lucknow'),
(88, 'Isha Sah', '9345678123', 'isha@email.com', 'Pune'),
(99, 'Kabir Joshi', '9011223344', 'kabir@email.com', 'Kolkata'),
(111, 'Tanvi Desai', '9445566778', 'tanvi@email.com', 'Ahmedabad');

INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount) VALUES
(101, 1, 11, '2025-07-25', 1000.00),
(102, 2, 11, '2025-07-28', 2500.00),
(103, 3, 22, '2025-07-20', 2000.00),
(104, 4, 22, '2025-07-22', 1500.00),
(105, 5, 33, '2025-07-15', 1000.00),
(106, 6, 33, '2025-07-18', 2500.00),
(107, 7, 44, '2025-07-12', 2000.00),
(108, 8, 44, '2025-07-10', 1500.00),
(109, 1, 55, '2025-07-30', 1000.00),
(110, 3, 55, '2025-07-28', 2000.00),
(111, 2, 66, '2025-07-25', 2500.00),
(112, 4, 66, '2025-07-23', 1500.00),
(113, 5, 77, '2025-07-20', 1000.00),
(114, 7, 77, '2025-07-18', 2000.00),
(115, 6, 88, '2025-07-15', 2500.00),
(116, 8, 88, '2025-07-10', 1500.00),
(117, 1, 99, '2025-07-05', 1000.00),
(118, 5, 99, '2025-07-08', 1000.00),
(119, 2, 111, '2025-07-02', 2500.00),
(120, 8, 111, '2025-07-01', 1500.00);


----------------------------------------------    #3. Manage Event Details   -------------------------------------------

#3a) Inserting a new event

INSERT INTO Events (Event_Name, Event_Date, Event_Location, Event_Description)
VALUES ('Tech Innovations Summit 2025', '2025-10-25','Bangalore', 'Get ready for AI Experience!');

SELECT * FROM Events;

#3b) Updating an event's information.

UPDATE Events
SET Event_Date = '2025-10-10', Event_Location = 'Delhi', Event_Description = 'Hello Delhi!! Don’t miss the Amazon Offline Sale featuring a specially curated collection just for you. Come explore great deals and discounts!'
WHERE Event_Id = 2; #can also update info using event name = 'Amazon Offline Sale')

SELECT * FROM Events;

#3c) Deleting an event

DELETE FROM Events
WHERE Event_Id = 3;

SELECT * FROM Events;

-------------------------#4) Manage Track Attendees & Handle Events---------------------------

#4a)Inserting a new attendee.

INSERT INTO Attendees(Attendee_Id, Attendee_Name, Attendee_Phone, Attendee_Email, Attendee_City)
values (222, 'Shikha Pandey', '9756523218', 'shikha@email.com', 'Bangalore');
SELECT * FROM Attendees;

#4b)Registering an attendee for an event.
INSERT INTO Registrations (Registration_Id, Event_Id, Attendee_Id, Registration_Date, Registration_Amount)
VALUES (121, 9, 222, '2025-07-10', 1200.00);
SELECT * FROM Registrations;

-----------------#5)Develop queries to retrieve event information, generate attendee lists, and calculate event attendance statistics.-----------------------

#5a)Retrieve All Event Information: List all events with number of attendees registered--

SELECT e.Event_Id, e.Event_Name, e.Event_Location, COUNT(r.Registration_Id) AS Total_Registrations_Count
FROM Events e
LEFT JOIN Registrations r ON r.Event_Id = e.Event_Id
GROUP BY e.Event_Id, e.Event_Name, e.Event_Location
ORDER BY Total_Registrations_Count DESC;

#5b)Retrieve All Specific Event Information:

SELECT * FROM Events
WHERE Event_Name = 'Amazon Offline Sale' OR Event_Name = 'Flipkart Festive Deals';

#5c)List of all Attendees Registered for an Event

SELECT e.event_date, e.event_name, a.Attendee_Id, a.Attendee_Name, a.Attendee_Phone, a.Attendee_Email, a.Attendee_City
FROM Attendees a
JOIN Registrations r ON a.Attendee_Id = r.Attendee_Id
JOIN Events e ON r.Event_Id = e.Event_Id
ORDER BY a.Attendee_Id;

#5d) Query Total Revenue Generated from Registrations per Event

SELECT e.Event_Id, e.Event_Name, e.Event_Location, COUNT(r.Attendee_Id) AS Total_Attendees, SUM(r.Registration_Amount) AS Total_Revenue
FROM Events e
JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name, e.Event_Location;

#5e) Event Attendance Details Including Registration Date and Amount

SELECT e.Event_Name, a.Attendee_Name, r.Registration_Date, r.Registration_Amount
FROM Registrations r
JOIN Events e ON r.Event_Id = e.Event_Id
JOIN Attendees a ON r.Attendee_Id = a.Attendee_Id
ORDER BY e.Event_Name, r.Registration_Date;

#5f) Rank Events by Number of Attendees

SELECT e.Event_Id, e.Event_Name, COUNT(r.Registration_Id) AS Total_Attendees_For_Event,
DENSE_RANK() OVER (ORDER BY COUNT(r.Registration_Id) DESC) AS Event_Rank
FROM Events e
LEFT JOIN Registrations r ON e.Event_Id = r.Event_Id
GROUP BY e.Event_Id, e.Event_Name;

#5g) Querying no of attendee per event and query a list showing each attendee’s details.

#Method 1 - CTE
WITH count_of_attendees AS(
SELECT Attendee_Id, count(Event_ID) AS Number_of_Events
FROM Registrations
GROUP BY Attendee_Id)

SELECT a.Attendee_Id, a.Attendee_Name, a.Attendee_Phone, a.Attendee_Email, a.Attendee_City, c.Number_of_Events
FROM Attendees a
JOIN count_of_attendees c ON c.Attendee_Id = a.Attendee_Id;

--#Method 2: Using Subquery----

SELECT a.Attendee_Id, a.Attendee_Name, a.Attendee_Email, a.Attendee_City,
(SELECT COUNT(*) FROM Registrations r 
WHERE r.Attendee_Id = a.Attendee_Id) AS Number_of_Events FROM Attendees a;


				  -------------------------------     #Task1     ------------------------------------
			    	
									   #Project: Academic Management System


				--------------------#1. Database Creation: Creating tables--------------------
#Create a student database

CREATE Database StudentProfile;

USE StudentProfile;

#a) Create the StudentInfo table with columns STU_ ID, STU_NAME, DOB, PHONE_NO,EMAIL_ID,ADDRESS.

CREATE table StudentInfo(
STU_ID INT PRIMARY KEY NOT NULL,
STU_NAME char(50) NOT NULL,
DOB date NOT NULL,
PHONE_NO varchar(50) NOT NULL,
EMAIL_ID varchar(100) NOT NULL UNIQUE,
ADDRESS varchar(100) NOT NULL
);

                                      ---------------------------------------------------

# b)Create the CoursesInfo table with columns COURSE_ID, COURSE_NAME,COURSE_INSTRUCTOR NAME.

create table CoursesInfo(
COURSE_ID INT PRIMARY KEY NOT NULL,
COURSE_NAME varchar(50) NOT NULL,
COURSE_INSTRUCTOR_NAME varchar(50) NOT NULL
);

									-----------------------------------------------------

#c) Create the EnrollmentInfo with columns ENROLLMENT_ID, STU_ ID, COURSE_ID.

create table EnrollmentInfo(
ENROLLMENT_ID INT PRIMARY KEY NOT NULL,
STU_ID int NOT NULL,
COURSE_ID int NOT NULL,
ENROLL_STATUS ENUM('Enrolled', 'Not Enrolled') NOT NULL,
    FOREIGN KEY (STU_ID) REFERENCES StudentInfo(STU_ID),
    FOREIGN KEY (COURSE_ID) REFERENCES CoursesInfo(COURSE_ID)
);

                                   ------------------------------------------------------
                                   
---------------------------------------- #2. Data Creation -----------------------------------------------

#Insert some sample data for StudentInfo table , CoursesInfo table, EnrollmentInfo with respective fields.

INSERT INTO StudentInfo (STU_ID, STU_NAME, DOB, PHONE_NO, EMAIL_ID, ADDRESS) VALUES
(1, 'Priyanka Sharma', '2000-05-15', '987-654-3210', 'priyanka.sharma@email.com', '123 MG Road, Mumbai'),
(2, 'Piyush Patel', '1999-08-22', '876-543-2100', 'piyush.patel@email.com', '123 Civil Lines, Delhi'),
(3, 'Rohan Verma', '2001-02-10', '765-432-1000', 'rohan.verma@email.com', '456 Banjara Hills, Hyderabad'),
(4, 'Nandini Iyer', '2000-11-30', '987-321-0987', 'nandini.iyer@email.com', '789 Anna Nagar, Chennai'),
(5, 'Vikram Gupta', '1998-07-14', '875-210-9876', 'vikram.gupta@email.com', '980 Sector 15, Bangalore'),
(6, 'Nikita Verma', '2002-03-19', '992-345-6780', 'nikita.verma@email.com', '11 Park Street, Kolkata'),
(7, 'Karan Mehra', '1999-12-25', '998-456-7891', 'karan.mehra@email.com', '22 Model Town, Ludhiana'),
(8, 'Snehal Reddy', '2000-06-07', '987-577-8902', 'snehal.reddy@email.com', '33 Jubilee Hills, Hyderabad'),
(9, 'Rahul Desai', '1998-09-03', '978-678-9013', 'rahul.desai@email.com', '44 Nariman Point, Mumbai'),
(10, 'Ishita Kapoor', '2001-01-11', '876-789-0124', 'ishita.kapoor@email.com', '55 Connaught Place, Delhi'),
(11, 'Amit Joshi', '2000-04-05', '867-890-1235', 'amit.joshi@email.com', '66 Residency Road, Bangalore'),
(12, 'Tanya Nair', '2002-02-28', '964-901-2346', 'tanya.nair@email.com', '77 Fort Kochi, Kochi'),
(13, 'Arjun Malhotra', '1999-10-15', '999-012-3457', 'arjun.m@email.com', '88 DLF Phase 3, Gurgaon'),
(14, 'Meera Dutta', '1998-11-20', '901-123-4568', 'meera.dutta@email.com', '99 Salt Lake, Kolkata'),
(15, 'Siddharth Jain', '2000-08-09', '912-234-5679', 'sid.jain@email.com', '10 Sector 62, Noida'),
(16, 'Pooja Bhatt', '2001-05-03', '923-345-6789', 'pooja.bhatt@email.com', '20 Koregaon Park, Pune'),
(17, 'Ritika Chauhan', '1999-06-27', '934-456-7890', 'ritika.ch@email.com', '30 Lalbagh, Lucknow'),
(18, 'Varun Khanna', '1998-03-14', '945-567-8901', 'varun.k@email.com', '40 MI Road, Jaipur'),
(19, 'Diya Sen', '2001-09-12', '956-678-9012', 'diya.sen@email.com', '50 College Street, Kolkata'),
(20, 'Yash Thakur', '2000-12-01', '967-789-0123', 'yash.t@email.com', '60 MG Road, Indore');

INSERT INTO CoursesInfo (COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME) VALUES
(101, 'Introduction to Programming in R', 'Dr. Sheetal Kapoor'),
(102, 'Business Intelligence and Analytics', 'Prof. Sunil Mehta'),
(103, 'Web Development with React and NextJS', 'Prof. Palak Desai'),
(104, 'Data Structures', 'Dr. Rajesh Bhatia'),
(105, 'Machine Learning and Artifical Intelligence', 'Prof. Shikha Verma'),
(106, 'Visualization with PowerBI and Tableau', 'Prof. Neha Ranjan');

INSERT INTO EnrollmentInfo (ENROLLMENT_ID, STU_ID, COURSE_ID, ENROLL_STATUS) VALUES
(1, 1, 101, 'Enrolled'),
(2, 1, 102, 'Enrolled'),
(3, 1, 103, 'Enrolled'),
(4, 2, 101, 'Not Enrolled'),
(5, 2, 103, 'Enrolled'),
(6, 2, 104, 'Enrolled'),
(7, 3, 102, 'Enrolled'),
(8, 3, 104, 'Not Enrolled'),
(9, 3, 105, 'Enrolled'),
(10, 4, 101, 'Enrolled'),
(11, 4, 106, 'Enrolled'),
(12, 5, 101, 'Not Enrolled'),
(13, 5, 102, 'Enrolled'),
(14, 6, 103, 'Enrolled'),
(15, 6, 104, 'Enrolled'),
(16, 6, 105, 'Not Enrolled'),
(17, 7, 101, 'Enrolled'),
(18, 7, 102, 'Enrolled'),
(19, 8, 104, 'Not Enrolled'),
(20, 8, 106, 'Enrolled'),
(21, 9, 103, 'Enrolled'),
(22, 9, 105, 'Enrolled'),
(23, 10, 101, 'Enrolled'),
(24, 10, 104, 'Not Enrolled'),
(25, 10, 106, 'Enrolled'),
(26, 11, 102, 'Enrolled'),
(27, 11, 103, 'Enrolled'),
(28, 12, 104, 'Not Enrolled'),
(29, 12, 105, 'Enrolled'),
(30, 12, 106, 'Enrolled'),
(31, 13, 101, 'Enrolled'),
(32, 13, 103, 'Not Enrolled'),
(33, 14, 102, 'Enrolled'),
(34, 14, 104, 'Enrolled'),
(35, 15, 105, 'Enrolled'),
(36, 15, 106, 'Enrolled'),
(37, 16, 101, 'Enrolled'),
(38, 16, 102, 'Not Enrolled'),
(39, 16, 103, 'Enrolled'),
(40, 17, 104, 'Enrolled'),
(41, 17, 105, 'Enrolled'),
(42, 18, 106, 'Enrolled'),
(43, 18, 101, 'Not Enrolled'),
(44, 18, 102, 'Enrolled'),
(45, 19, 103, 'Enrolled'),
(46, 19, 105, 'Enrolled'),
(47, 20, 104, 'Enrolled'),
(48, 20, 106, 'Not Enrolled');

						 --------------# 3) Retrieve the Student Information-------------

# 3a) Write a query to retrieve student details, such as student name, contact informations, and Enrollment status.

select s.STU_ID, s.STU_NAME, s.PHONE_NO, s.EMAIL_ID, s.ADDRESS, e.COURSE_ID, c.COURSE_NAME, e.ENROLL_STATUS FROM studentinfo s
LEFT JOIN EnrollmentInfo e ON e.STU_ID = s.STU_ID
LEFT JOIN CoursesInfo c ON c.COURSE_ID = e.COURSE_ID
ORDER BY s.STU_ID;

------ #METHOD 2 WITH COALESCE ------

SELECT s.STU_ID, s.STU_NAME, s.ADDRESS, s.PHONE_NO, s.EMAIL_ID, c.COURSE_NAME, COALESCE(e.ENROLL_STATUS, 'Not Enrolled') AS STUDENT_ENROLLMENT_STATUS
FROM StudentInfo s
LEFT JOIN EnrollmentInfo e ON e.STU_ID = s.STU_ID
LEFT JOIN CoursesInfo c ON c.COURSE_ID = e.COURSE_ID
ORDER BY s.STU_ID, c.COURSE_NAME;

							---------------------------------------------------------
#3b) Write a query to retrieve a list of courses in which a specific student is enrolled.
select s.STU_NAME, s.STU_ID,c.COURSE_ID, e.Enroll_status, c.COURSE_NAME FROM CoursesInfo c
LEFT JOIN EnrollmentInfo e ON e.COURSE_ID = c.COURSE_ID
LEFT JOIN studentinfo s ON e.STU_ID = s.STU_ID
WHERE s.STU_ID = 12 AND e.ENROLL_STATUS = 'Enrolled'
ORDER BY c.COURSE_NAME;

                ---------------------------------------------------
#3c) Write a query to retrieve course information, including course name, instructor information.

---- #simple approach ----
select * FROM coursesinfo;

---- #with view ----
CREATE OR REPLACE VIEW view_course_info AS
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo;

SELECT * FROM view_course_info 
ORDER BY COURSE_ID;

                ---------------------------------------------------
#3d) Write a query to retrieve course information for a specific course.

---- #with view ----
CREATE OR REPLACE VIEW view_course_information AS
SELECT COURSE_ID, COURSE_NAME, COURSE_INSTRUCTOR_NAME
FROM CoursesInfo
WHERE Course_Name= "Business Intelligence and Analytics";

SELECT * FROM view_course_information 
ORDER BY COURSE_ID;

---- # simple query ----
select * FROM coursesinfo
WHERE COURSE_NAME = 'Business Intelligence and Analytics';

                ---------------------------------------------------
#3e) Write a query to retrieve course information for multiple courses.

select * FROM coursesinfo
WHERE COURSE_ID IN (102, 104, 106)
AND Course_Name IS NOT NULL AND Course_ID IS NOT NULL
ORDER BY COURSE_ID;

#3f) Test the queries to ensure accurate retrieval of student information.( execute the queries and verify the results against the expected output.) 

-- Retrieve entire information(sanity checks) --
SELECT * FROM StudentInfo;

-- Total number of students(sanity checks) --
SELECT COUNT(*) AS total_students FROM StudentInfo;

SELECT * FROM CoursesInfo;
SELECT * FROM EnrollmentInfo;

-- #metadata checks --
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'studentprofile';

--------#4. Reporting and Analytics (Using joining queries)---------

#4a) Write a query to retrieve the number of students enrolled in each course

SELECT c.course_name, COUNT(s.STU_ID) AS Count_of_enrolled_students FROM studentinfo s
LEFT JOIN enrollmentinfo e ON e.STU_ID = s.STU_ID
LEFT JOIN coursesinfo c ON e.course_id = c.course_id
WHERE Enroll_status = 'Enrolled'
GROUP BY c.course_name
ORDER BY count_of_enrolled_students DESC;

                ---------------------------------------------------
                
#4b) Write a query to retrieve the list of students enrolled in a specific course
SELECT s.STU_ID, s.STU_NAME, s.DOB, s.PHONE_NO, s.EMAIL_ID, s.ADDRESS FROM studentinfo s
JOIN enrollmentinfo e ON s.stu_id=e.stu_id
JOIN coursesinfo c ON c.course_id = e.course_id
WHERE course_name = "Machine Learning and Artifical Intelligence" AND enroll_status = "Enrolled"
ORDER BY s.STU_ID;
                ---------------------------------------------------
                
#4c) Write a query to retrieve the count of enrolled students for each instructor.

SELECT c.COURSE_INSTRUCTOR_NAME, COUNT(CASE WHEN e.ENROLL_STATUS = 'Enrolled' THEN 1 END) AS Count_of_enrolled_Students
FROM CoursesInfo c
LEFT JOIN EnrollmentInfo e ON c.course_id = e.course_id
GROUP BY c.course_instructor_name
ORDER BY Count_of_enrolled_Students DESC;

               ----------------------------------------------
               
#4d) Write a query to retrieve the list of students who are enrolled in multiple courses.
SELECT s.STU_ID, s.STU_NAME, EMAIL_ID, COUNT(distinct e.COURSE_ID) AS Courses_Enrolled FROM studentinfo s
JOIN enrollmentinfo e ON s.stu_id=e.stu_id
AND e.enroll_status = "Enrolled"
GROUP BY s.STU_ID
HAVING COUNT(distinct e.COURSE_ID) > 1
ORDER BY Courses_Enrolled DESC;

                   ---------------------------------------------
#4e) Write a query to retrieve the courses that have the highest number of enrolled students(arranging from highest to lowest)

-- with RANK and DENSE RANK --
WITH subject_enroll_counts AS (
  SELECT c.COURSE_ID, c.COURSE_NAME, COUNT(CASE WHEN e.ENROLL_STATUS = 'Enrolled' THEN 1 END) AS No_of_Students_Enrolled
  FROM CoursesInfo c
  LEFT JOIN EnrollmentInfo e ON e.COURSE_ID = c.COURSE_ID
  GROUP BY c.COURSE_ID, c.COURSE_NAME
),
rank_of_subject AS (
  SELECT *,
  RANK() OVER (ORDER BY No_of_Students_Enrolled DESC) AS Subject_Rank
  FROM subject_enroll_counts)
  
SELECT * FROM rank_of_subject
WHERE Subject_Rank = 1
ORDER BY COURSE_NAME;

-- #simple JOIN Query --
SELECT c.Course_ID, c.COURSE_NAME, COUNT(s.STU_ID) AS No_of_Students_Enrolled FROM studentinfo s
JOIN enrollmentinfo e ON s.stu_id=e.stu_id
JOIN coursesinfo c ON c.course_id = e.course_id
WHERE e.enroll_status = "Enrolled"
GROUP BY c.COURSE_NAME, c.Course_ID
ORDER BY No_of_Students_Enrolled DESC 
LIMIT 2;


-------------------------------     #Task2     ------------------------------------
			    	
                    #Project: Student Database Management System

-----------------------------------------------------------------------------------

#1. Database Setup
#Create a database named "student_database."

Create database Student_database;

USE student_database;

----#Create table-----

CREATE TABLE student_table (
    Student_id INT PRIMARY KEY AUTO_INCREMENT,
    Stu_name VARCHAR(50) NOT NULL,
    Department VARCHAR(100) NOT NULL,
    email_id VARCHAR(255) UNIQUE,
    Phone_no VARCHAR(20),
    Address VARCHAR(100),
    Date_of_birth DATE NOT NULL,
    Gender VARCHAR(50),
    Major VARCHAR(100) NOT NULL,
    GPA DECIMAL(3,2) NOT NULL,
    Grade VARCHAR(10), 
    CONSTRAINT check_grade CHECK (Grade IN ('A', 'B', 'C', 'D', 'E','F'))
);

--------------------------------------------------

#2. Data Entry
#Insert 10 sample records into the "student_table" using INSERT command

INSERT INTO student_table (Stu_name, Department, email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade
) VALUES
('Rohan Sharma', 'Computer Science', 'rohan.sharma@univ.in', 9876543210, 'Mira Road, Mumbai', '2000-05-15', 'Male', 'AI & ML', 9.20, 'A'),
('Riya Singh', 'Electronics', 'riya.singh@univ.in', 8765432109, 'Lajpat Nagar 2, Delhi', '1999-08-22', 'Female', 'Embedded Systems', 8.30, 'B'),
('Roshan Gupta', 'Mechanical', 'roshan.gupta@univ.in', 7654321098, '333 Banjara Hills, Hyderabad', '2001-02-10', 'Male', 'Automobile', 7.10, 'C'),
('Radhika Iyer', 'Information Technology', 'radhika.iyer@univ.in', 6543210987, '444 Anna Nagar, Chennai', '2000-11-30', 'Female', 'Cyber Security', 9.50, 'A'),
('Vikram Sah', 'Electrical', 'vikram.sah@univ.in', 9123456780, 'HSR Layout, Bangalore', '1998-07-14', 'Male', 'Power Systems', 6.80, 'D'),
('Neha Reddy', 'Computer Science', 'neha.reddy@univ.in', 9988776655, 'Plot 66, Jubilee Hills, Hyderabad', '2001-01-25', 'Female', 'Cloud Computing and Blockchain', 5.60, 'E'),
('Arjun Mehta', 'Civil', 'arjun.mehta@univ.in', 9876501234, '78 Marine Drive, Mumbai', '2000-06-18', 'Male', 'Structural Engineering', 4.90, 'F'),
('Mansi Desai', 'Computer Science', 'mansi.desai@univ.in', 9001234567, 'Vasant Kunj, South Delhi', '1999-09-29', 'Female', 'Data Science', 8.75, 'B'),
('Rahul Sinha', 'Mechanical', 'rahul.sinha@univ.in', 8888999900, '12 Residency Road, Lucknow', '2002-03-14', 'Male', 'Robotics and AI', 6.20, 'D'),
('Sneha Joshi', 'Electronics', 'sneha.joshi@univ.in', 9876123450, 'Amarpali, Sector 12, Noida', '2001-12-20', 'Female', 'VLSI Design', 7.85, 'C');


#3. Student Information Retrieval

---------------#3.Student Information Retrieval-----------------
#Develop a query to retrieve all students' information from the "student_table" and sort them in descending order by their grade.

#method 1
SELECT * FROM student_table
ORDER BY Grade;

#method 2
SELECT * FROM student_table
ORDER BY FIELD(Grade,'A','B','C','D','E','F');


-----------------#4.Query for Male Students------------------------
#Implement a query to retrieve information about all male students from the "student_table."

SELECT * FROM student_table
WHERE Gender = 'Male'
ORDER BY stu_name;

--------------------#5. Query for Students with GPA less than 5.0---------------------
#Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table."

SELECT * FROM student_table
WHERE GPA < 5.0;

SELECT COUNT(*) AS no_of_students_below_5GPA
FROM student_table
WHERE GPA < 5.0;

#---------6. Update Student Email and Grade----------------
#Write an update statement to modify the email and grade of a student with a specific ID in the "student_table."

UPDATE student_table
SET email_id = 'newid@univ.in', GRADE = 'B'
WHERE Student_id = 3;

SELECT * FROM student_table;

#----------------7. Query for Students with Grade "B"---------------
#Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table.

SELECT Stu_Name, TIMESTAMPDIFF(YEAR, Date_of_birth, CurDate()) AS Age FROM Student_table
WHERE GRADE = 'B'
ORDER BY Age;

--------------#8. Grouping and Calculation-----------------
#Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination

SELECT Department, Gender, ROUND(avg(GPA),2) AS Average_GPA_Per_Dept
FROM student_table
GROUP BY Department, Gender
ORDER BY average_GPA_Per_Dept desc;

-----------------#9. Table Renaming-----------------------
#Rename the "student_table" to "student_info" using the appropriate SQL statement.

RENAME table student_table to student_info;
SELECT * FROM student_info LIMIT 5; # to check the execution of renamed table


-----------------#10. Retrieve Student with Highest GPA
#Write a query to retrieve the name of the student with the highest GPA from the "student_info" table.

#method 1
SELECT Stu_Name, GPA FROM student_info
ORDER BY GPA DESC
LIMIT 1;

#method 2
SELECT Stu_name, GPA FROM student_info
WHERE GPA = (SELECT MAX(GPA) FROM student_info);

#method 3
SELECT Stu_name, GPA FROM(
SELECT *,
RANK() OVER (ORDER BY GPA DESC) AS highest_GPA_rank FROM student_info) As highest_GPA_rank
WHERE highest_GPA_rank = 1;
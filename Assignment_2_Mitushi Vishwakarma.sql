CREATE database SISDB;
USE SISDB;

create table Students(
student_id int primary key identity(1,1),
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(50) unique,
phone_number char(15)
);

create table Teacher(
teacher_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50) unique
);

create table Courses(
course_id int primary key,
course_name varchar(50) unique not null,
credits int,
teacher_id int foreign key(teacher_id) references Teacher(teacher_id) on delete cascade
);

create table Enrollments(
enrollment_id int primary key,
student_id int foreign key(student_id) references Students(student_id) on delete cascade,
course_id int foreign key(course_id) references Courses(course_id) on delete cascade,
enrollment_date date
);

create table Payments(
payment_id int primary key,
student_id int not null foreign key(student_id) references Students(student_id) on delete cascade,
amount decimal(10,2) not null,
payment_date date not null
);

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
    ('Riya', 'Sharma', '1999-05-20', 'riyasharma@example.com', '123-456-5555'),
    ('Jane', 'Smith', '1998-08-21', 'jane.smith@example.com', '987-654-3210'),
    ('David', 'Johnson', '1997-03-10', 'david.johnson@example.com', '555-123-4567'),
    ('Emily', 'Williams', '1996-11-28', 'emily.williams@example.com', '789-456-1230'),
    ('Michael', 'Jones', '1999-04-05', 'michael.jones@example.com', '333-555-7777'),
    ('Sarah', 'Brown', '1997-09-17', 'sarah.brown@example.com', '222-888-9999'),
    ('Matthew', 'Miller', '1998-12-02', 'matthew.miller@example.com', '444-111-0000'),
    ('Olivia', 'Davis', '1996-06-20', 'olivia.davis@example.com', '666-999-3333'),
    ('Ethan', 'Moore', '1999-02-14', 'ethan.moore@example.com', '111-222-4444'),
    ('Ava', 'Wilson', '1997-07-08', 'ava.wilson@example.com', '999-777-6666');
	
INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Professor', 'Johnson', 'prof.johnson@example.com'),
    (2, 'Dr.', 'Williams', 'dr.williams@example.com'),
    (3, 'Ms.', 'Brown', 'ms.brown@example.com'),
    (4, 'Mr.', 'Miller', 'mr.miller@example.com'),
    (5, 'Mrs.', 'Davis', 'mrs.davis@example.com'),
    (6, 'Dr.', 'Moore', 'dr.moore@example.com'),
    (7, 'Ms.', 'Wilson', 'ms.wilson@example.com'),
    (8, 'Mr.', 'Clark', 'mr.clark@example.com'),
    (9, 'Mrs.', 'Taylor', 'mrs.taylor@example.com'),
    (10, 'Dr.', 'Anderson', 'dr.anderson@example.com');

INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
    (1, 'Introduction to Computer Science', 3, 1),
    (2, 'Advanced Mathematics', 4, 2),
    (3, 'History of Art', 3, 3),
    (4, 'English Literature', 3, 4),
    (5, 'Physics 101', 4, 5),
    (6, 'Chemistry Basics', 3, 1),
    (7, 'Psychology 101', 3, 6),
    (8, 'Spanish Language', 2, 8),
    (9, 'Environmental Science', 4, 4),
    (10, 'Business Ethics', 3, 10);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 1, '2023-01-10'),
    (2, 2, 2, '2023-01-12'),
    (3, 3, 3, '2023-01-15'),
    (4, 4, 1, '2023-01-20'),
    (5, 4, 5, '2023-01-25'),
    (6, 6, 4, '2023-02-01'),
    (7, 10, 9, '2023-02-05'),
    (8, 8, 8, '2023-02-10'),
    (9, 9, 6, '2023-02-15'),
    (10, 10, 10, '2023-02-20'),
	(11,5,3,'2023-12-03');


INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
    (1, 1, 500.00, '2023-02-01'),
    (2, 2, 700.50, '2023-02-03'),
    (3, 3, 600.75, '2023-02-05'),
    (4, 4, 800.20, '2023-02-07'),
    (5, 4, 450.90, '2023-12-05'),
    (6, 6, 550.60, '2023-02-12'),
    (7, 10, 900.30, '2023-02-15'),
    (8, 8, 750.80, '2023-02-18'),
    (9, 9, 400.50, '2023-02-20'),
    (10, 10, 600.00, '2023-02-22'),
	(11,5,300.00 ,'2023-12-15');

-- 1.
insert into Students (first_name,last_name,date_of_birth,email,phone_number) values
('John','Doe','1995-08-15','john.doe@example.com','123-456-7890');
select * from Students;

-- 2.
insert into Enrollments values (12,7,4,'2023-12-01');
select * from Enrollments;

-- 3. 
update Teacher set email='mrmiller@gmail.com' where teacher_id = 4;
select * from Teacher;

-- 4.
select * from Enrollments
delete from Enrollments where student_id = 10 and course_id = 10;

-- 5.
select * from Courses;
update Courses set teacher_id = 7 where course_id = 6;

-- 6.
delete from Students where student_id = 6;
select * from Students;
select * from Enrollments;
select * from Payments;

-- 7.
update Payments set amount = 600 where student_id = 9;

-- JOINS 
-- 1.
select sum(p.[amount]),s.[first_name],s.last_name from Students as s
join Payments as p on s.student_id = p.student_id
where s.student_id = 4
group by s.[student_id],s.[first_name],s.last_name;

-- 2.
select c.[course_name],count(e.[student_id]) as noofstudents from Courses as c
left join Enrollments as e on e.course_id = c.course_id
group by [course_name];

-- 3.
select distinct s.first_name,s.last_name,s.student_id from Students as s
left join Enrollments as e on e.student_id=s.student_id
--where e.student_id is null
where s.student_id not in (select student_id from Enrollments);

-- 4.
select s.first_name,s.last_name,c.course_name from Students as s
join Enrollments as e on e.student_id=s.student_id
join Courses as c on e.course_id = c.course_id

-- 5.
select c.course_name,t.first_name,t.last_name,t.teacher_id from Courses as c
join Teacher as t on t.teacher_id = c.teacher_id

-- 6.
select s.first_name,s.last_name,c.course_name,e.[enrollment_date] from Students as s
join Enrollments as e on e.student_id=s.student_id
join Courses as c on e.course_id = c.course_id
where c.course_id = 1;

-- 7.
select s.first_name,s.last_name,s.student_id from Students as s
left join Payments as p on p.student_id = s.student_id
left join Enrollments as e on e.student_id=s.student_id
where p.student_id is null and e.student_id is not null

-- 8.
select c.course_name,e.[enrollment_id],e.course_id from Courses as c
left join Enrollments as e on e.course_id=c.course_id
where e.course_id is null

select c.course_name,count(e.[course_id]) as no_of_enrollments from Courses as c
left join Enrollments as e on e.course_id=c.course_id
group by course_name
having count(e.[course_id]) = 0

-- 9.

SELECT e1.student_id,s.first_name,s.last_name,e1.course_id
FROM Enrollments e1
JOIN Enrollments e2
ON e1.student_id = e2.student_id
AND e1.course_id != e2.course_id
JOIN Students AS s ON e1.student_id = s.student_id;

/*
select * from Enrollments as e1
join Enrollments as e2 on e1.student_id = e2.student_id

select * from Enrollments as e1
join Enrollments as e2 on e1.enrollment_id = e2.enrollment_id
*/

-- 10.
select t.first_name,t.last_name,c.course_id from Teacher as t
left join Courses as c on c.teacher_id=t.teacher_id
where c.course_id is null

-- Aggregate Functions and Subqueries
-- 1. 

select c.course_id,c.course_name,AVG(enrollment_count) as average_students_enrolled from Courses as c
LEFT JOIN (SELECT course_id,COUNT(student_id) as enrollment_count 
FROM Enrollments GROUP BY course_id) as course_enrollments on c.course_id = course_enrollments.course_id
GROUP BY c.course_id, c.course_name;


-- 2.
select s.student_id,p.amount from Students as s
join Payments as p on s.student_id=p.student_id
where p.amount in (select max(amount) from Payments)

select * from Payments

select s.student_id,sum(p.amount) from Students as s
join Payments as p on s.student_id=p.student_id 
group by s.student_id
having sum(p.amount) in 
(select max(payments) from (select student_id,sum(amount) as payments from Payments group by student_id) as payments);

-- 3.
select course_id,count(student_id) from Enrollments
group by course_id 
having count(student_id) in ( select max(count_student) as count_max from (select course_id,count(student_id) as count_student from Enrollments
group by course_id) as max_count) 

-- 4.
select t.teacher_id,t.first_name,t.last_name,sum(p.amount) as total_payments from Teacher as t
join Courses as c on c.teacher_id = t.teacher_id
left join Enrollments as e on e.course_id=c.course_id
left join Students as s on s.student_id = e.student_id
left join Payments as p on p.student_id=s.student_id
group by t.teacher_id,t.first_name,t.last_name;

-- 5.
select count(e.student_id),e.first_name,e.last_name,s.course_id from Students as e
join Enrollments as s on s.student_id=e.student_id
group by s.course_id,e.first_name,e.last_name
having count(e.student_id) in (select count(course_id) from Courses)

-- 6.
select t.teacher_id,t.first_name,t.last_name from Teacher as t 
where t.teacher_id not in
(select tr.teacher_id from Teacher as tr join Courses as c on tr.teacher_id = c.teacher_id)

select t.teacher_id,t.first_name,t.last_name,c.course_id from Teacher as t
left join Courses as c on c.teacher_id=t.teacher_id
where c.teacher_id is null

-- 7.
select avg(st.age) as average_age from (select DATEDIFF(year,date_of_birth,getdate()) as age from Students as s) as st;

-- 8.
SELECT course_id, course_name FROM Courses
WHERE course_id NOT IN(
	SELECT Courses.course_id FROM Courses 
	JOIN Enrollments ON Courses.course_id = Enrollments.course_id
);

-- 9.
SELECT Students.first_name, Students.last_name, SUM(Amount) AS TotalPayments FROM Students 
JOIN Enrollments  ON Students.student_id = Enrollments.student_id
JOIN Courses  ON Enrollments.course_id = Courses.course_id
JOIN Payments  ON Enrollments.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;

-- 10.
SELECT Students.first_name, Students.last_name FROM Students 
WHERE student_id IN (
	SELECT student_id From Payments
	GROUP BY student_id
	HAVING COUNT(*)>1
);

-- 11.
SELECT Students.first_name, Students.last_name, SUM(Amount) AS TotalPayments FROM Students 
JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;

-- 12.
SELECT course_name, COUNT(enrollment_id) FROM Courses 
JOIN Enrollments ON Courses.course_id = Enrollments.course_id
GROUP BY course_name;

-- 13.
SELECT  Students.first_name, Students.last_name, AVG(Amount) From Students
JOIN Payments ON Students.student_id = Payments.student_id
GROUP BY Students.first_name, Students.last_name;

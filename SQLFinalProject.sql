-- specify the database 
use School 
go
-- 2 create first table students 

create table student (
StudentID int primary key identity not null,
Name nvarchar(50) not null,
Age int,
Email nvarchar(50)
)

-- 1 create second table courses 

create table Courses (
CourseID int primary key identity not null,
CourseName nvarchar(50)
)


-- 3 enter 3 records for students 
insert into student 
values ('Abdullah Ali', 18, 'Abdullah@hotmail.com'),
('Fawaz Bader', 23, 'Fawaz@gmail.com'),
('Mohammad Hamad', 21, 'Mohammad@gmail.com')

insert into Courses values
('Physics'), ('Math')

-- 4 display all courses and students
select * from dbo.Courses 

select * from dbo.student

select stu.Name, cour.CourseName
from dbo.student stu inner join dbo.Courses cour
on stu.StudentID = cour.CourseID

-- 5 update student email address 

update dbo.student
set Email = 'BaderAli@gmail.com'
where StudentID = 2

select * from dbo.Student

-- 6 Delete a course for a specific student 

delete from dbo.Courses
WHERE StudentID = 2 AND CourseName = 'Math';

select *from dbo.Courses

-- 7 Add a new column gender to the student table 
alter table dbo.student 
add Gender nvarchar(50)

-- 8 update gender column 

update dbo.student 
set Gender = 'male'
where StudentID in (1, 2)

update dbo.Student
set Gender = 'female'
where StudentID in  (3)

-- 9 retrieve count of courses 


-- 10 select students whose name start with m 
select * from dbo.student
where name like 'm%'

-- 11 convert names to uppercase 
select upper (name) from dbo.student 

-- 12 convert courses to lowercase
select lower (CourseName) from dbo.Courses

-- 15 retrieve using an alias

-- 16 insert new student and enroll them in two courses 
insert into dbo.student values 
('Ahmad Damra', 19, 'ahmed@gmail.com', 'male')

insert into dbo.Courses values 
('biology', 7),
('sports', 7)

-- 17 find the youngest student 
select * from dbo.student 
WHERE Age = (select MIN(Age) from dbo.student)

-- 18 delete a student and all their courses 
delete from dbo.Student 
where studentID = 2

delete from dbo.Courses
where StudentID = 2

-- 20 retrieve course names in alphabetical order
select * from dbo.Courses 
order by CourseName

-- 21 create procedure to display all students with course names 
 create proc sp_DisplayStudents 
 as select stu.name, cour.coursename
from dbo.student stu inner join dbo.Courses cour 
on stu.StudentID = cour.CourseID

exec sp_DisplayStudents 

 -- 22 create procedure to display students with course name and id 
 create proc sp_DisplayIDS  
 as select stu.name, cour.CourseName
from dbo.student stu inner join dbo.Courses cour 
on stu.StudentID = cour.CourseID

exec sp_DisplayStudents 

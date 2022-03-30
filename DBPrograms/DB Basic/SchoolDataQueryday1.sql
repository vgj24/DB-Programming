--SchoolData Databse is used with Three tables are used StudentInfo,TeacherInfo,And,SubDetails --

--createDatabase--
create Database SchoolData

--use Database--
use SchoolData

--Create Table--
create table StudentInfo(
StudentID int primary key Identity,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Std varchar(20) not null,
division varchar(2) not null,
classteacher varchar(20) not null
)
----1.Querying Database----
select *from StudentInfo

--Insert to table--
insert into StudentInfo values('Ganesh','Gupta','second','A','Mrs.Chobe'),
('Gita','Mishra','second','A','Mrs.Chobe'),
('Rishabh','Node','second','B','Mrs.Chobe')
('Sonali','Chobe','Third','A','Mrs.Chobe')
insert into StudentInfo values('Shreyas','Lele','First','B','Mr.Shete'),
('Gauri','Gupta','Third','B','Mr.Gore'),
('Niti','Seth','Third','B','Mr.Gore'),
('Priya','Mehta','First','B','Mr.Shete'),
('Rani','Kapoor','First','A','Mrs.Joshi')
insert into StudentInfo values('Swati','Muley','First','C','Mr.Lele','65','5')
--update StudentInfo set techerId='4'
--update StudentInfo--
update StudentInfo set PercentageMarks='60' where StudentID in(1,4,6,5,2)
update StudentInfo set PercentageMarks='70' where StudentID in(3,7)
update StudentInfo set PercentageMarks='55' where StudentID in(8,9)
--alter table--
alter table StudentInfo add PercentageMarks decimal(20) 

--using Where clause--
Select *from StudentInfo where classteacher='Mrs.Chobe'

----2. Sorting Data----

--Applying groupby with sum avg min max--
select Std,Avg(percentageMarks) as'Average Result of School' ,Sum(percentageMarks) 
as 'Sum of All Student MArks', Count(StudentID) as 'no. of students'from StudentInfo group by Std
 
--using OrderBy Clause--
select FirstName, LastName from StudentInfo ORDER BY FirstName

--alter table--
alter table StudentInfo add techerId decimal(20)
select *from StudentInfo

--create teacher table--
create table TeacherInfo(
techerId int primary key identity,
TeacherName varchar(20) not null,
Division varchar(20) not null,
Sub varchar(20) not null)

--create SubDetails Table--
create table SubDetails(
subID int primary key identity,
SubjectName varchar(20) not null,
subjectTeacher varchar(20) not null)

--inserting values to TeacherInfo Table--
insert into TeacherInfo values('Mrs.Chobe','A','Maths'),
('Mr.Shete','B','English'),
('Mr.Gore','B','ComputerBasics'),
('Mrs.Joshi','A','Env')
insert into TeacherInfo values('Mr.More','B','Bio')


--insert values to Subdetails--
insert into SubDetails values('Maths','Mrs.Chobe'),
('English','Mr.Shete'),
('ComputerBasics','Mr.Gore'),
('Env','Mrs.Joshi')


--Querying Data From Student Info,TeacherInfo,SubDetails--
select *from StudentInfo
select *from TeacherInfo
select *from SubDetails
update StudentInfo set division='A' where StudentID=3

--Delete row From  StudentInfo-- 
Delete from StudentInfo Where StudentID=4

--rough queries--
--alter table TeacherInfo add teacherIncharge varchar(20)
--insert into TeacherInfo values('Mrs.Dube','A','Maths1')

----3. Limiting Rows----

--Offset Fetch--
select *from StudentInfo order by StudentID offset 6 ROWS
select *from StudentInfo order by StudentID offset 5 ROWS fetch next 2 ROWS only

--SelctTOP--
select TOP 3 FirstName From StudentInfo order by StudentID Asc

----- 4. Filtering Data-----

--using Distinct Clause--
select Distinct LastName from StudentInfo
--using where clause--
select *from StudentInfo where Division='A'
--using AND Clause--
select *from StudentInfo where std='second' AND division='A'
--using OR Clause--
select *from StudentInfo where std='second' OR classteacher='Mrs. Chobe'
--using IN Cluause--
select StudentID,FirstName from StudentInfo where FirstName IN('Ganesh','Niti') order by FirstName
--using BETWEEN--
select StudentID,FirstName from StudentInfo where StudentID BETWEEN 5 AND 8 order by StudentID
--using LIKE--
select FirstName from StudentInfo where  FirstName LIKE '[GA]%'
--using ColumnAndTable Alises--
select FirstName, LastName from StudentInfo ORDER BY FirstName
select studentID,FirstName, LastName from StudentInfo order by StudentID Asc
select StudentID,FirstName,LastName from StudentInfo order by StudentID Desc

---Joins---
select *from StudentINfo
update StudentInfo set TecherId='1' where StudentID Between 1 and 3
update StudentInfo set TecherId='2' where StudentID IN(5,8)
update StudentInfo set TecherId='3' where StudentID IN(6,7)
update StudentInfo set TecherId='4' where StudentID IN(9)

--INNER JOIN--
select FirstName,LastName ,percentageMarks,classteacher from StudentInfo s INNER JOIN TeacherInfo t on s.techerId=t.techerId order by FirstName ASC

--LEFT JOIN--
select *from StudentInfo
Select FirstName ,LAstNAme,StudentId,TeacherName
from StudentInfo s 
LEFT JOIN TeacherInfo f ON f.Division=s.division 
order by FirstName Asc


select 
*from TeacherInfo t
Left join StudentInfo s on s.techerId =t.techerid
order by StudentID

select 
*from StudentInfo s 
Left join TeacherInfo f on f.TeacherName= s.classteacher
order by StudentID Asc

--RIGHT JOIN-- /*Accourding to Right Table it matches the left table and shows the result
select *from TeacherInfo

Select FirstName ,LAstNAme,StudentId,TeacherName
from StudentInfo s 
Right JOIN TeacherInfo f ON f.Division=s.division 
order by FirstName Asc

Select 
*from  TeacherInfo f 
RIGHT JOIN StudentInfo s  ON s.techerId=f.techerId 
order by StudentID Asc

Select TeacherName,FirstNAme,LastName
from  TeacherInfo f 
RIGHT JOIN StudentInfo s  ON s.techerId=f.techerId 
order by StudentID Asc

Select FirstNAme,LastName,TeacherName
from  StudentInfo s
RIGHT JOIN TeacherInfo f  ON f.techerId =s.techerId
order by StudentID Asc

select Sub ,TeacherName
from SubDetails b RIGHT JOIN TeacherInfo t ON b.SubjectName=t.Sub
order by Sub Asc

select TeacherName,Sub 
from TeacherInfo t RIGHT JOIN SubDetails b ON b.SubjectName=t.Sub
order by Sub Asc

select SubID,TeacherName
from SubDetails b RIGHT JOIN TeacherInfo t on b.subjectTeacher = t.TeacherName 
order by subID Asc

select TeacherName,SubID
from  TeacherInfo t RIGHT JOIN SubDetails b on b.subjectTeacher = t.TeacherName 
order by subID Asc


--Full Join--
select 
*from StudentInfo s
FULL OUTER JOIN TeacherInfo t ON s.techerId=t.techerId
order by StudentID Asc

alter table teacherInfo alter column division varchar(2)
Delete from StudentInfo where FirstName='swati'
select *from StudentInfo

--self join-- /*A self join allows you to join a table to itself. It helps query hierarchical data or compare rows within the same table.*/
select *from TeacherInfo
select t1.TeacherName,t1.TeacherName,t2.sub
from TeacherInfo t1
INNER JOIN TeacherInfo t2 ON t2.techerID=t1.TecherInchargeID
order by sub ASC

update TeacherInfo set teacherincharge= 'mr.Jedhe' 
alter table TeacheriNfo Add TecherInchargeID decimal(20)
update TeacherInfo set TecherInchargeID = '1' 

--Cross Join-- /*joins The CROSS JOIN joined every row from the first table (T1) with every row from the second table (T2).*/
select FirstName,TeacherName
from StudentInfo s
CROSS JOIN TeacherInfo T
ORDER BY FirstName
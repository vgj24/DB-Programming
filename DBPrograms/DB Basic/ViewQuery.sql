--Advanced DbMS : Views--

Use SchoolData
--create views--
create view Showstudentdata
as
select *from StudentInfo
go
--Executing View--
select *from Showstudentdata

--using one view in another view--
create view maxpercentageStudent
as
select FirstName,PercentageMarks from Showstudentdata where PercentageMarks>'60'
go
--executing view--
select *from maxpercentageStudent

--alter view--
alter view maxpercentageStudent
as
select studentid,FirstName,PercentageMarks from Showstudentdata where PercentageMarks>'60' 
go

select *from maxpercentageStudent

create view tryteacherview
as
select teachername from TeacherInfo
go

select *from tryteacherview

--drop view--
drop view tryteacherview

--inert into view---

insert into Showstudentdata(FirstName,LastName,STD,Division,classteacher,percentageMarks,techerid)
values('swastik','sharma','third','B','mr. Gore','69','3')

---index view---

create view indexView
with schemabinding
as
select Firstname,
LastName,
classteacher,
Division,
PercentageMarks
from dbo.StudentInfo

select *from indexView



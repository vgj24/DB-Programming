--SchoolData Databse is used with Three tables are used StudentInfo,TeacherInfo,And,SubDetails --
select *from StudentInfo
select *from TeacherInfo
select *from SubDetails

--Section 6 Grouping Data--
--Group by--
Select Division ,Count(studentId) as 'Division wise Students' from StudentInfo  GROUP BY Division

select PercentageMarks as 'Result percentage'  from StudentInfo where StudentID	BETWEEN 1 AND 9 GROUP BY percentageMarks

select Division,classteacher as 'Classteacher of Division'from StudentInfo where StudentID in(1,4,5) GROUP BY Division,classteacher ORDER BY Division

--Having--
select Classteacher,avg(percentageMarks) as 'Avg class result above 60'   from StudentInfo Group by classteacher having avg(PercentageMarks) >=60 order by classteacher

select division, MAX(percentageMarks) as 'Students Above 60' from StudentInfo Group by Division having MAX(percentageMarks)>60 order by division

--Grouping Sets--
select  Division, count(studentID) as 'students in  on division' from StudentInfo Group by division 
UNION all
select Division, count(techerID) as 'classteacher for one division' from TeacherInfo Group by division order by division

--CUBE--
Select Division, Std,classteacher from StudentInfo GROUP BY division, CUBE(std,classteacher)
Select Division,classteacher from StudentInfo GROUP BY CUBE(division,classteacher)
Select Division,std,classteacher from StudentInfo GROUP BY CUBE(division,std,classteacher)

---Section 8 .Sets---
--Unoin--/*combine the row data vertically

Select FirstName From StudentInfo UNION  Select TeacherName From TeacherInfo
select FirstNAme ,division From StudentInfo Union Select teacherName , division From TeacherInfo 
select FirstNAme ,division From StudentInfo Union ALL Select teacherName , division From TeacherInfo 

--InterSect : returns the intercetion of two queries
insert into StudentInfo values('priya','mehara','Second','A','Mr. Shashri','58','2')
select classteacher from StudentInfo Intersect select teacherName from TeacherInfo

--Except : returns result from first table witch doesnt match --
select classteacher from StudentInfo Except select teacherName from TeacherInfo
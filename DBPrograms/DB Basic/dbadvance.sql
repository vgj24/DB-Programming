--SchoolData Databse is used with Three tables are used StudentInfo,TeacherInfo,And,SubDetails --

use SchoolData
select *from StudentInfo
select *from TeacherInfo
select *from SubDetails

--Stored procedure-- /*stored procedure is nothing but the stored sql queries for further use */
--CREATE STORED PROCEDURE FOR DISPLAYING STUDENT TABLE DATA
CREATE PROCEDURE SelectAllStudents
AS
select *from StudentInfo
GO;
--execute stored procedure
EXEC SelectAllStudents

--CREATE STORED PROCEDURE FOR DISPLAYING TEACHER TABLE DATA
CREATE PROCEDURE SelectAll
AS
select *from StudentInfo
select *from TeacherInfo
select *from SubDetails
GO;
EXEC SelectAll

--CREATE STORED PROCEDURE FOR DISPLAYING Student and TEACHER and subdetals TABLE DATA
CREATE PROCEDURE SelectAllTeacher
AS
select *from TeacherInfo
GO;
EXEC SelectAllTeacher

--control flow statements--
--BEGIN END--
BEGIN 
	SELECT percentageMArks
	 from StudentInfo 
	where PercentageMarks='80'

	IF @@ROWCOUNT=0
	PRINT 'NO STUDENT FOUND WITH 80 PERCENT MARKS';
END

BEGIN
	SELECT TeacherName 
	FROM TeacherInfo
	WHERE TeacherName='mrs.Chobe'

	IF @@TEXTSIZE != 0
	PRINT 'found teacher Name'
END

--IF ELSE--

DECLARE @variable int;
BEGIN 
select @variable =count(studentid)
from StudentInfo
END
IF @variable >=10
BEGIN
	Print 'Strength is full'
END
ELSE
BEGIN
	PRINT 'ADMISSIONS ARE OPEN'
END

--While stmt--
DECLARE @variable1 int;
BEGIN 
select @variable1 =count(studentid)
from StudentInfo
END
While @variable1!=10
BEGIN 
	PRINT 'ADMISSIONS ARE OPEN'
END
BEGIN
	PRINT 'ADMISSIONS ARE FULL'
END
--while--
DECLARE @variable2 int;
BEGIN 
select @variable2 =count(studentid)
from StudentInfo
END
While @variable2 <=12
BEGIN 
	SET @variable2=@variable2+1;
	PRINT @variable2;
	IF(@variable2 = 11)
	BREAK;
END
--cONTINUE--
DECLARE @variable3 int;
BEGIN 
select @variable3 =count(studentid)
from StudentInfo
END
While @variable3 <=12
BEGIN 
	SET @variable3=@variable3+1;
	PRINT @variable3;
	IF(@variable3 = 11)
	CONTINUE;
END

--try catch--
DECLARE @A int;
		--@B int;
BEGIN 
select @A =count(studentid)
from StudentInfo
END
BEGIN TRY
	SET @A = @A/0; 
END TRY
BEGIN CATCH
SELECT
 ERROR_MESSAGE()
END CATCH


EXEC sp_addmessage 
    @msgnum = 50004, 
    @severity = 1, 
    @msgtext = 'tHIS IS A custom error message';

SELECT *FROM sys.messages WHERE message_id = 50004;

RAISERROR ( 'Whoops, an error occurred.',1,1)

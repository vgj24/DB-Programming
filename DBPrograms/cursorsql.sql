use SchoolData

--cursor--
DECLARE 
		@studentId int,
		@FirstName varchar(20),
		@LastName varchar(20),
		@percentageMarks decimal

DECLARE cursor_student CURSOR 
FOR SELECT StudentId,FirstName,LastName,percentageMarks
FROM StudentInfo

OPEN cursor_student;

FETCH NEXT FROM cursor_student INTO
@StudentID,@FirstName,@LastName,@percentageMarks

WHILE @@FETCH_STATUS=0
BEGIN
		PRINT CONCAT('STUDENTID',@STUDENTid);
		PRINT CONCAT('Name :',@FirstName,' ',@LastName);
		--PRINT CONCAT(' ',@LastName);
		PRINT CONCAT('Percentage',@percentageMarks);
		FETCH NEXT FROM cursor_student INTO
		 @StudentID,@FirstName,@LastName,@percentageMarks
END
		
CLOSE cursor_student

DEALLOCATE cursor_student
use SchoolData
--database :schooldata
--table employeeData

---create EmployeeData table---

CREATE TABLE EmployeeData
(
EmpID int,
EmpName varchar(20),
City varchar(20),
EmpRoll varchar(20),
dateofjoining decimal,
salary decimal 
)
Alter table EmployeeData
Drop column dateofjoining 

insert into EmployeeData 
values('1','natasha','Amdabad','Trainee','20000')
insert into EmployeeData 
values
('2','Sneha','Satara','devloper','40000')
insert into EmployeeData 
values
('3','Swaram','Rajput','softwareTester','30000'),
('4','Tejas','Chatopadhay','SalesExecutive','35000'),
('5','Sunita','Kolambi','FinnaceHead','50000'),
('6','Suraj','Jahagirdar','Accountant','45000')

select*from EmployeeData

--TableValued Functions
CREATE FUNCTION Fun_Employee()
returns table
as
return(select *from EmployeeData)

select *from Fun_Employee()

drop function if exists Fun_EmployeeInformation
--Scalar Function --

CREATE FUNCTION ScalarFun
(
	@EmpName varchar(20),
	@city varchar(20)
)
returns nvarchar(100)
as
begin return(select @EmpName +' '+@city+ ' ')
end

select dbo.ScalarFun('Sneha','Satara')  Details 

drop function if exists scalarFunction
---scalar function---
CREATE FUNCTION ScalarSalaryincreament1
(
	@EmpName varchar(20),
	@salary decimal(20)
)
returns nvarchar(100)
as

begin return(Select @EmpName+' '+(@salary+3000)+' ')
end

---Alter Scalar Function ---

Alter FUNCTION ScalarSalaryincreament1 
(
	@salary decimal(20)
)
returns nvarchar(100)
as
begin
return (select @salary+3000)
end

--execute scalar function----
select dbo.ScalarSalaryincreament1('5000') deatails

----A NUMERIC SCALR FUNCTION ---
CREATE FUNCTION NumFun
(
		 @NUM1 DECIMAL(20),
		 @NUM2 DECIMAL(20)
)
RETURNS DECIMAL(20)
AS
BEGIN
	DECLARE @Result DECIMAL(20)
	SET @Result=@NUM1+@NUM2
	RETURN @Result
END
---ececute numfun function--
SELECT dbo.NumFun(20,23) addition

--SystemFunction--
--avg,min,max,count--
select avg(salary) as 'Avg Salary' ,min(salary) as 'Min Salary', max(salary) as 'Max Salary', count(EmpID) as 'total workers' from EmployeeData

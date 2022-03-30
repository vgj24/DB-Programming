--TranscationSQLQery
use schooldata
--databse: schooldata ; table: studenttable
CREATE TABLE EmployeeTrans
(
EmpID int,
EmpName varchar(20),
City varchar(20),
EmpRoll varchar(20),
dateofjoining decimal,
salary decimal 
)
--drop dateogjoining column--
alter table employeetrans drop column dateofjoining
--display employeetrans data--
select *from EmployeeTrans

--*****implicit transactions*****--
-- Commit Transaction if All query Works fine --
INSERT INTO EmployeeTrans values('1','ganesh','pune','trainee','20000')
INSERT INTO EmployeeTrans values('1','Shambhavi','Mumbai','trainee','20000'),
								('1','Vighnesh','pune','Sr.developer','70000'),
								('1','Shreys','Delhi','jr.Developer','40000')
SET Implicit_TRANSACTIONS ON
--INSERT VALUES--
INSERT INTO EmployeeTrans values('1','mithilesh','pune','trainee','20000')
INSERT INTO EmployeeTrans values('1','renuka','thane','trainee','20000'),
								('1','umesh','NAgar','Sr.developer','70000'),
								('1','sadhna','BHuvneshawar','jr.Developer','40000')


--UPDATE --
UPDATE EmployeeTrans set salary='30000' where EmpName='Shreys'
select @@TRANCOUNT as opentranscount
commit
Select @@TRANCOUNT as OpenTransactions

/****-- Rollaback Transaction if any one query in Transaction Fails--*****/
SET Implicit_TRANSACTIONS ON
--insert
Insert into EmployeeTrans values('mithilesh','pune','trainee','20000') --this query fails necaz id is not given
--update
Update EmployeeTrans set salary='50000' where EmpName ='Shreys'
--delete
delete EmployeeTrans where EmpName='umesh'

select @@TRANCOUNT as opentranscount
ROLLBACK
select @@TRANCOUNT as opentranscount

--/*****commit ising variable---******/
SET Implicit_TRANSACTIONS ON
--insert
Insert into EmployeeTrans values('2','mithilesh','pune','trainee','20000') --this query fails necaz id is not given
--update
Update EmployeeTrans set salary='50000' where EmpName ='Shreys'
--delete
delete EmployeeTrans where EmpName='umesh'

DECLARE @conditioncheck INT
SET @conditioncheck =1
IF (@conditioncheck =1)
BEGIN 
	COMMIT
END
ELSE
BEGIN 
	ROLLBACK
END
--FOR ROLLBACK
BEGIN TRANSACTION
/*****EXPLICIT TRANSACTION*******/


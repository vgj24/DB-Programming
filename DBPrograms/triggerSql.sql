use SchoolData
--usinf schooldata and customerInfo table ---
--triggers--
create table CustomerInfo
(
id int primary key identity,
CustomerName varchar(20),
City Varchar(20),
Product_purchased varchar(20),
product_price decimal(20)
)

select *from customerInfo

---create trigger---
CREATE TRIGGER dbo.customer_trg1
ON customerInfo
AFTER INSERT, DELETE
AS
BEGIN
	SET NOCOUNT ON

INSERT INTO dbo.customerInfo
(

CustomerName ,
City ,
Product_purchased ,
product_price
)

SELECT 

i.CustomerName ,
City ,
Product_purchased ,
product_price

FROM inserted i

UNION ALL
SELECT 

d.CustomerName ,
City ,
Product_purchased ,
product_price

FROM DELETED d

END

INSERT INTO CustomerInfo values('mitali','pune','dress','1454')

select *from customerInfo

---listing triggers---

SELECT NAME,
is_instead_of_trigger
FROM
sys.triggers
WHERE
TYPE= 'TR';

--remove trigger--

Drop trigger IF EXISTS customer_trigger


--trigger to update data---

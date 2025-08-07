# Lesson 3: Importing and Exporting Data

✅ Importing Data (BULK INSERT, Excel, Text)
✅ Exporting Data (Excel, Text)
✅ Comments, Identity column, NULL/NOT NULL values
✅ Unique Key, Primary Key, Foreign Key, Check Constraint
✅ Differences between UNIQUE KEY and PRIMARY KEY

🟢 Easy-Level Tasks (10)
-- 1. Define and explain the purpose of BULK INSERT in SQL Server.
--'BULK' is a command to add data in SQl server fastly

--2. List four file formats that can be imported into SQL Server.
--csv, txt, xls, xml

--3.Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table products (
productID int primary key,
productName Varchar(50),
Price Decimal(10,2))

--4.Insert three records into the Products table using INSERT INTO.
insert into products (productID, ProductName, Price)
values (1, 'Apple', 5.30),
(2, 'Milk',3.25),
(3, 'Bread', 2.85);

--5.Explain the difference between NULL and NOT NULL.
NULL allows that cell can have no infromarion, while NOT NULL means cell always have some information and cannot be empty

--6.Add a UNIQUE constraint to the ProductName column in the Products table.
ALTER TABLE Products
ADD CONSTRAINT UniqueProductName UNIQUE (ProductName);

--7.Write a comment in a SQL query explaining its purpose.
it means some values cannot be repeated 

--8.Add CategoryID column to the Products table.
Alter table products 
add  CAtegoryID int;
--9.Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
Create table CAtegories (
CategoryID int Primary Key,
CategoryName int unique);

--10.Explain the purpose of the IDENTITY column in SQL Server.
identity column in excel is purposed to give unique identities to raws

--🟠 Medium-Level Tasks (10)
-- 11. Use BULK INSERT to import data from a text file into the Products table.
bulk insert products;

--12. Create a FOREIGN KEY in the Products table that references the Categories table.
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50)
);

--13. Explain the differences between PRIMARY KEY and UNIQUE KEY.
--primary key is main dentificator of the raw (for exmaple passport number)
--unique key different but not esential

--14.Add a CHECK constraint to the Products table ensuring Price > 0.
alter table products
add check(price>0);

--15.Modify the Products table to add a column Stock (INT, NOT NULL).
alter table products
add stock int not null;

--16. Use the ISNULL function to replace NULL values in Price column with a 0.
update products
set price =0
where price is null; 

--17.Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
--Foreign KEY is and identificator connecting tables with each other

🔴 Hard-Level Tasks (10)
--18.Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
alter table customers
add check (age>18)

--19.Create a table with an IDENTITY column starting at 100 and incrementing by 10.
CREATE TABLE Products (
  ProductID INT IDENTITY(100, 10) PRIMARY KEY,
  ProductName VARCHAR(50),
  Price DECIMAL(10,2)
);

--20.Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails(
OrderNumber int primary key);

--21.Explain the use of COALESCE and ISNULL functions for handling NULL values.
--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
create table employees (
empID int primary key,
email int unique );

--22. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
CREATE TABLE Employees (
  EmpID INT PRIMARY KEY,
  Name VARCHAR(100),
  DepartmentID INT,
  FOREIGN KEY (DepartmentID)
    REFERENCES Departments(DepartmentID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

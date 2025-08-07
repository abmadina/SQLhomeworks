# Lesson 2: DDL and DML Commands

> **Notes before doing the tasks:**
> - Tasks should be solved using **SQL Server**.
> - Case insensitivity applies.
> - Alias names do not affect the score.
> - Scoring is based on the **correct output**.
> - One correct solution is sufficient.

---

### **Basic-Level Tasks (10)**  
-- 1. Create a table `Employees` with columns: `EmpID` INT, `Name` (VARCHAR(50)), and `Salary` (DECIMAL(10,2)).
Create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2));

--2. Insert three records into the `Employees` table using different 
--INSERT INTO approaches (single-row insert and multiple-row insert).
-- single raw 
insert into employees (empID, Name, Salary)
values (1, 'Ann', 550);
-- multiple raw 
insert into employees (empID, Name, Salary)
values (1, 'Ann', 550),
(2, 'Tom', 650),
(3, 'Alex', 700);

-- 3. Update the `Salary` of an employee to `7000` where `EmpID = 1`. 
update employees
set salary = 7000
where empID = 1;

--4. Delete a record from the `Employees` table where `EmpID = 2`.  
delete from employees2
where empid = 2;

--5. Give a brief definition for difference between `DELETE`, `TRUNCATE`, and `DROP`.
--Delete is used to delete data matching some conditions for example delete where salary=500
--Truncate deletes all rows from the table
--Drop delete all database

--6. Modify the `Name` column in the `Employees` table to `VARCHAR(100)`.  
alter table employees
alter column  name varchar(100);

--7. Add a new column `Department` (`VARCHAR(50)`) to the `Employees` table.
alter table employees
add  department Varchar(50);
--8. Change the data type of the `Salary` column to `FLOAT`. 
alter table employees
alter column salary float;

--9. Create another table `Departments` with columns `DepartmentID` (INT, PRIMARY KEY) and `DepartmentName` (VARCHAR(50)).
DROP TABLE DEPARTMENTS
create table departments (
DepartmentID int primary key,
DepartmentName Varchar(50),
SALARY INT)

--10. Remove all records from the `Employees` table without deleting its structure.  
truncate table employees;

--### **Intermediate-Level Tasks (6)**  
--11. Insert five records into the `Departments` table using `INSERT INTO SELECT` 
--method(you can write anything you want as data).  
Insert into departments
values (1, 'IT'),
(2,'Marketing'), (3, 'Finance'), (4, 'Production'), (5, 'HR');

12. Update the `Department` of all employees where `Salary > 5000` to 'Management'.
update departments
set department = 'management'
where salary > 5000

-- 13. Write a query that removes all employees but keeps the table structure intact.  
truncate table employees;

--14. Drop the `Department` column from the `Employees` table. 
alter table employees
drop column department;

--15. Rename the `Employees` table to `StaffMembers` using SQL commands.
alter table employees
rename to Staffmembers;

--16. Write a query to completely remove the `Departments` table from the database.  
Drop table departments

### **Advanced-Level Tasks (9)**        
--17. Create a table named Products with at least 5 columns, including: ProductID (Primary Key), 
--ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
create table products (
productID int primary key,
productName Varchar(50),
Category Varchar(50),
Price Decimal(10,0))

--18. Add a CHECK constraint to ensure Price is always greater than 0.
alter table products
add check (price > 0);
--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
alter table products
add  StockQuantity int default  50;
--20. Rename Category to ProductCategory
Alter table products,
rename Category to ProductCategories;

--21. Insert 5 records into the Products table using standard INSERT INTO queries.
Insert into products (productID, productName, ProductCategory, Price)
values (1, 'Apple', 'Fruit', 5),
(2, 'Banana', 'Fruit', 4),
(3, 'Cucumber', 'Vegetables', 3),
(4, 'Potato', 'Vegetables', 2),
(5, 'Peach', 'fruit', 3);

--22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
select*into products_backup
from products

--23. Rename the Products table to Inventory.
alter table products
rename to Inventory

-- 24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
alter table inventory
alter price type float;
--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to `Inventory` table.
SELECT 
  IDENTITY(INT, 1000, 5) AS ProductCode,
 
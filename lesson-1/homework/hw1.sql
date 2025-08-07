
--Homework 1
-- Easy
Task 1
-- Define the following terms: data, database, relational database, and table.
--    data-это не структурированные данные
--    database-место для хранения данных базы 
--    relational database - данные в виде таблиц которые связанны друг с другом
--    table струтурированные данные

Task 2
-- List five key features of SQL Server.
--fast performance, data protection and security, easy to connect, supports data analysis, convinient tools

Task 3
-- What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
-- Windows Authentication — использует виндовс аккаунт для безопасного входа
-- SQL Server Authentication — запрашивает логин и пароль для регистрации

-- Medium
Task 4
-- Create a new database in SSMS named SchoolDB.
create database schoolDB;

Task 5
--Write and execute a query to create a table called Students with columns: 
--StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).

create table schoolDB
(studentID INT PRIMARY KEY, Name VARCHAR(50), Age INT);

Task 6
-- Describe the differences between SQL Server, SSMS, and SQL.
SQL Server - это система управления базами данных.
SSMS - программа для работы с SQL Server.
SQL - язык, на котором общаются с базой данных.

-- Hard
Task 7
-- Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.
--DQL(Data Query language) is used to retrieve data from database for example:
select*from;
--DML(Data Manipulation Language) is used to change or modify data in database without changing stucture.
update, insert and etc
--DDL(Data Definition language) is used to define and modify the structure of database objects 
create, alter, drop, truncate
--TCL(Transaction Control Language) is used to manage database transactions
commit,rollback,savepoint

Task 8
-- Write a query to insert three records into the Students table.
create table students (
studentID int,
StudentName varchar(100));

insert into students (studentID, StudentName)
values (1, 'Tom Hardy'),
(2, 'Ann Smith'),
(3, 'Joe Black');


Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the 
database from this link 

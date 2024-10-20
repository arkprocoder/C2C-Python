-- C:\Program Files\MySQL\MySQL Server 8.0\bin
-- mysql -u root -p

show databases;
create database c2c;
show tables;
drop database c2c;
create database c2c;
use c2c;

-- create the table
CREATE Table Contact(
    id int,
    Name varchar(20),
    email varchar(50),
    phone varchar(12),
    description varchar(100)
);

desc Contact;

-- drop the table
drop table contact; -> it deleted the table and all the records as well
truncate table contact; -> delete all the records but table structure will remain same;

Insert into contact(id,name,email,phone,description) values(1,'guvi','guvi@gmail.com',999999999,'this is a iit incubated company');
Insert into contact(id,name,email,phone,description) values(2,'tcs','t@gmail.com',999899999,'this is a iit incubated company');
Insert into contact(id,name,email,phone,description) values(3,'infosys','i@gmail.com',999993399,'this is a iit incubated company');
Insert into contact(id,name,email,phone,description) values(4,'hcl','h@gmail.com',997799999,'this is a iit incubated company');


Select * from contact;
select id,name from contact;
select * top 2 from contact;

Insert into contact values(5,'abc','abc@gmail.com',7896541203,'aaaaa');

select * from contact where name='hcl';
select name from contact where description='this is a iit incubated company' or name='hcl';
select * from contact where id=2 and name='tcs';

select * from contact where name IN ('tcs','hcl');

Insert into contact(id,name,email,phone) values(6,null,null,997799999);
Insert into contact(id) values(7);

Update contact
set name='wipro',description='this is mnc',phone='7474747474',email='wipro@wipro.com'
where id=7;

Update contact
set name='harman',description='this is mnc',phone='9874587459',email='harman@harman.com'
where name='NULL';


Update contact
set description='this is best companies'
where description='this is a iit incubated company';


delete from contact
where id=6;

delete from contact
where id=7 and name='abc';

delete from contact
where id=7 or name='abc';

delete from contact;

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT
);

insert into employees (EmployeeID,FirstName,LastName,Age) values (1,'aryan','smith',30);
insert into employees (EmployeeID,FirstName,LastName,Age) values (2,'dwyne','smith',30);
insert into employees (EmployeeID,FirstName,LastName,Age) values (3,'dwyne',null,40);
insert into employees (EmployeeID,FirstName,LastName,Age) values (3,'dwyne','',40);

update employees
set LastName='zee'
where EmployeeID=3;


CREATE TABLE Users(
    USERID INT PRIMARY Key,
    Username varchar(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    password varchar(30)
);

insert into Users values(1,'aryan','aryan@gmail.com','india');
insert into Users values(2,'aryan','aryan@gmail.com','india'); -- error

insert into Users  (UserID, Username, Email) values (2,'smith','smith@gmail.com');
insert into Users  ( UserID,Email ) values (3,'ark@gmail.com');

CREATE TABLE BusinessUsers(
    USERID INT PRIMARY Key,
    Username varchar(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password varchar(30) NOT NULL
);

insert into BusinessUsers  (UserID, Username, Email,password) values (1,'smith','smith@gmail.com','******');
insert into BusinessUsers  (UserID, Username, Email,password) values (2,'cummins','cummins@gmail.com','******');


-- Primary Keys;

Create Table Products(
    ProductID int Primary Key,
    ProductName varchar(100) NOT NULL,
    Price Decimal(10,2)
);
Insert into Products values(1,'Laptop',25999.99);
Insert into Products values(1,'Mobile',15000.99); ---error
Insert into Products values(2,'Mobile',15000.99);

--Foreign Key Constraints

Create Table Departments(
DepartmentId Int Primary Key,
DepartmentName varchar(100) NOT NULL
);

Create Table Employees(
    EmployeeID INT Primary KEY,
    FirstName varchar(100) NOT NULL,
    LastName varchar(100) NOT NULL,
    DepartmentId INT,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId) 
);

Insert into Departments values(1,'Engineering');
Insert into Departments values(2,'HR');
Insert into Departments values(3,'Finance');
Insert into Departments values(4,'Manager');


Insert into Employees values(1,'aadithyaa','rajath',1);
Insert into Employees values(2,'amrutha','bhatta',2);
Insert into Employees values(3,'nazneen','anjum',3);
Insert into Employees values(4,'ark','pro',1);
Insert into Employees values(5,'harshith','bhaskar',4);
Insert into Employees values(6,'aryan','d',2);
Insert into Employees values(7,'anees','khan',1);


-- CHECK Constraints 

CREATE Table Orders(
    OrderID INT Primary KEY,
    Quantity Int,
    Price Decimal(10,2),
    CHECK (Quantity>0 AND Price>=0)
);

Insert into Orders (OrderID,Quantity,Price) values(1,5,199.99);
Insert into Orders (OrderID,Quantity,Price) values(2,0,299.99);
Insert into Orders (OrderID,Quantity,Price) values(3,10,500);
Insert into Orders (OrderID,Quantity,Price) values(4,-10,-500.55);



-- Default Contraint

Create Table Customers(
    CustomerID INT Primary Key,
    CustomerName varchar(100) NOT NULL,
    Country varchar(50) Default 'INDIA'
);

Insert into Customers(CustomerID,CustomerName) values (1,'Naz');
Insert into Customers(CustomerID,CustomerName) values (2,'Anee');
Insert into Customers(CustomerID,CustomerName,Country) values (3,'alice','US');



Alter table Employees
Add Age INT;

-- Dropping the column

Alter Table Employees
Drop column LastName;

Alter table Employees
Add LastName VARCHAR(10);


-- modifying the data type
Alter Table employees
MODIFY column Age varchar(3);



-- add the constraint
Alter Table Employees
ADD CONSTRAINT unique_full_name UNIQUE(FirstName,LastName);
-- The Employees table now has a UNIQUE constraint on the combination of FirstName and LastName

-- ADD CONSTRAINT unique_full_name -> future keep track if i want to drop
-- UNIQUE(FirstName,LastName)- combination of FirstName and LastName should not match

-- Jhon Cena 
-- Jhon guard
-- Cena Jhon
-- Jhon Cena



drop database c2c;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary) VALUES
(1, 'John', 'Doe', 30, 'HR', 50000.00),
(2, 'Jane', 'Smith', 40, 'Engineering', 60000.00),
(3, 'Alice', 'Johnson', 25, 'HR', 45000.00),
(4, 'Bob', 'Brown', 50, 'Engineering', 70000.00),
(5, 'Charlie', 'Davis', 35, 'Marketing', 55000.00),
(6, 'Emily', 'White', 28, 'Engineering', 48000.00);


select * from employees
where (Department='HR' and age<35) or (Department='Engineering' and Salary>50000);


Select * from employees
order by Department ASC , Salary DESC;



Select * from Employees
Where age<=30
or department='Marketing'
ORDER BY Age ASC ,LastName asc;




-- MIN 
Select MIN(Age) AS yougestAge
From Employees;

Select MIN(Salary) AS minSal
From Employees;

Select MAX(Age) AS highAge
From Employees;

Select MAX(Salary) AS maxSal
From Employees;


Select MIN(salary) as MinSal , MAX(Salary) as maxSal
from employees
where department='Engineering';

Select MAX(salary) - MIN(Salary) as salDIfference
from employees;

-- count

Select COUNT(EmployeeID) AS totalemployess
from employees;

Select Department, COUNT(*) as NumberofEmployees
from employees
GROUP BY Department;


-- AVG
Select AVG(Salary) as Avgsalary
from employees;

Select AVG(age) as Avgage
from employees;

Select Department, AVG(Salary) AS AverageSalary
from employees
GROUP BY Department;

-- SUM
Select SUM(Salary) as TotalEmployeesSalary
from employees;

Select Department, SUM(Salary) AS TotalEmployeesSalary
from employees
GROUP BY department;



CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary, HireDate) VALUES
(1, 'John', 'Doe', 30, 'HR', 50000.00, '2018-01-15'),
(2, 'Jane', 'Smith', 40, 'Engineering', 60000.00, '2017-04-23'),
(3, 'Alice', 'Johnson', 25, 'HR', 45000.00, '2019-03-11'),
(4, 'Bob', 'Brown', 50, 'Engineering', 70000.00, '2016-11-30'),
(5, 'Charlie', 'Davis', 35, 'Marketing', 55000.00, '2018-07-19'),
(6, 'Emily', 'White', 28, 'Engineering', 48000.00, '2020-08-05');


Select Department, Count(*) as noofemployees
from employees
group by department;


Select Department, Count(*) as noofemployees
from employees
group by department
Having count(*)>1;





INSERT INTO Employees (EmployeeID, FirstName, LastName, Age, Department, Salary, HireDate) VALUES
(7, 'John1', 'Doe1', 30, 'HR', 50000.00, '2018-01-15'),
(8, 'Jane1', 'Smith1', 40, 'Engineering', 60000.00, '2017-04-23');


SELECT Department,Age, Count(*) as noofemployees
FROM employees
GROUP BY department,Age;


-- Find the number of employees hired each year.
Select YEAR(HireDate) as HiredYear , Count(*) as numberofemployees
from employees
group by YEAR(HireDate);



CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Country VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Country) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 'INDIA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', 'Canada'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.net', 'UK'),
(4, 'Bob', 'Brown', 'bob.brown@example.org', 'INDIA'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'Australia'),
(6, 'Emily', 'White', 'emily.white@example.com', 'INDIA');


Select * from Customers
where FirstName LIKE 'J%';


Select * from Customers
where FirstName LIKE '%b';


Select * from Customers
where FirstName LIKE '%';

Select * from Customers
where FirstName LIKE '%i%';


Select * from Customers
where FirstName LIKE '%____l%';

select * from Customers
where email Like '%.com';


select * from Customers
where email NOT Like '%.com';


-- IN operators
-- The SQL IN operator is used to filter the result set based on a list of specified values. It is a shorthand for multiple OR conditions. Let's explore the IN operator in depth with various examples and scenarios.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    TotalAmount DECIMAL(10, 2)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status, TotalAmount) VALUES
(1, 101, '2023-01-15', 'Shipped', 150.00),
(2, 102, '2023-02-20', 'Pending', 200.00),
(3, 101, '2023-03-11', 'Cancelled', 50.00),
(4, 103, '2023-04-10', 'Shipped', 300.00),
(5, 104, '2023-05-05', 'Pending', 100.00),
(6, 105, '2023-06-25', 'Shipped', 250.00);


Select * from Orders 
where Status='Pending' or Status='Shipped';

Select * from Orders 
where Status IN ('Shipped','Pending');


Select * from Orders 
where Status NOT IN ('Shipped','Pending');

-- IN- Subquieries
--  Find all orders where the customer has another order with 'Cancelled' status.
Select * from orders
where CustomerID IN (Select CustomerID from orders where status='Cancelled');

Select * from orders
where CustomerID IN ('101');



Select * from orders 
where OrderDate BETWEEN '2023-01-01' AND '2023-05-01';

Select * from orders 
where OrderDate NOT BETWEEN '2023-01-01' AND '2023-03-01';


10 - 20
11,12,13,14,15,16,17,18,19

10 and 20


Create Table Department(
    deptId int not NUll Auto_Increment,
    deptName varchar(40) Not Null,
    Primary Key (deptId)
);

Insert Into Department (deptName) Values ('HR');
Insert Into Department (deptName) Values ('Finance');
Insert Into Department (deptName) Values ('Digital Solution');
Insert Into Department (deptName) Values ('Developer');
Insert Into Department (deptName) Values ('Accounts');
Insert Into Department (deptName) Values ('Frontend');
Insert Into Department (deptName) Values ('Backend');

Create Table Employee(
    empID int Not null Auto_Increment,
    employeeName varchar(30) not null,
    employeeSalary Bigint,
    employeePhoneNumber Bigint Not Null,
    deptId int,
    Primary Key (empID),
    Foreign key (deptid) REFERENCES Department(deptId)

);

Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Anees',25000,9874589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Amrutha',55000,9874544654,4);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Aadithyaa',35000,8884589654,1);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Meghana',65000,9995559654,2);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Akhil',25000,9874589994,1);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Vinod',45000,9872589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber) Values ('Aneeka',85000,9800089654);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Priyanka',75000,7774589654,3);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('Naz',175000,9974589654,2);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('rajath',275000,9999589654,1);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('rahul',5000,99995812354,5);
Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber) Values ('rani',75000,9999584554);

-- Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('a',175000,9999884554,9);
-- Insert Into Employee (employeeName,employeeSalary,employeePhoneNumber,deptId) Values ('b'275000,9999774554,10);

-- Inner Join

-- Select table1.column_name, table2.column_name
-- from table1
-- Inner join table2
-- on tabl1.columnname=table2.column_name


Select Employee.empID, Employee.employeeName,Employee.employeeSalary,Department.deptName
from Employee
Inner Join Department
ON Employee.deptId=Department.deptId;


-- Left Join
-- Select columns
-- from table1
-- Left join table2
-- on tabl1.columnname=table2.column_name


Select emp.empID, emp.employeeName, emp.employeePhoneNumber,emp.employeeSalary,dpt.deptName
from Employee as emp
Left join department as dpt
ON emp.deptId=dpt.deptId;


-- Right Join

-- Select columns
-- from table1
-- Right join table2
-- on tabl1.columnname=table2.column_name

Select emp.empID, emp.employeeName, emp.employeePhoneNumber,emp.employeeSalary,dpt.deptName
from Employee as emp
Right join department as dpt
ON emp.deptId=dpt.deptId;


-- full join

-- Select emp.empID, emp.employeeName, dept.deptName
-- from employee emp
-- FULL JOIN Department dept
-- ON emp.deptId=dept.deptId;

-- UNION | LEFT | RIGHT


Select emp.empID, emp.employeeName, dept.deptName
from employee emp
LEFT JOIN Department dept
on emp.deptId=dept.deptId
UNION
Select emp.empID, emp.employeeName, dept.deptName
from employee emp
RIGHT JOIN Department dept
on emp.deptId=dept.deptId;

customers
+----+-------------+-----------+
| id | customer_id | name      |
+----+-------------+-----------+
| 1  | C001        | John Doe  |
| 2  | C002        | Jane Smith|
| 3  | C003        | Emily Clark|
+----+-------------+-----------+

orders
+----+-------------+------------+-------+
| id | customer_id | order_date | total |
+----+-------------+------------+-------+
| 1  | C001        | 2024-09-15 | 100   |
| 2  | C003        | 2024-10-01 | 200   |
| 3  | C001        | 2024-10-10 | 150   |
+----+-------------+------------+-------+

1. Write a SQL query to retrieve each customer’s name and their total orders (if any). Ensure that customers who don’t have orders are also included.




SELECT Customers.name, Orders.total
FROM Customers
LEFT JOIN Orders
ON Customers.customer_id = Orders.customer_id;



students
+----+-----------+------+
| id | name      | age  |
+----+-----------+------+
| 1  | Alice     | 21   |
| 2  | Bob       | 22   |
| 3  | Charlie   | 20   |
+----+-----------+------+

Grades

+----+------------+-------+
| id | student_id | grade |
+----+------------+-------+
| 1  | 1          | A     |
| 2  | 2          | B     |
| 3  | 3          | A     |
+----+------------+-------+
Write a query to retrieve the names of all students along with their grades. Ensure that students only with  grades  included in the result.
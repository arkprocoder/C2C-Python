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
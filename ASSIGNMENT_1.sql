--   DDL    --

CREATE DATABASE TECHSHOP;
USE TECHSHOP;

-- Creating tables

CREATE TABLE Customers(
CustomerID INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone CHAR(10) NOT NULL,
Address VARCHAR(150),
);

CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50) NOT NULL,
Description TEXT NOT NULL,
Price DECIMAL(10,2) NOT NULL,
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT NOT NULL,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
);

CREATE TABLE OrderDetails(
OrderDetailID INT PRIMARY KEY,
OrderID INT NOT NULL FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
ProductID INT NOT NULL FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
Quantity INT NOT NULL,
);

alter table OrderDetails
  ADD constraint OrderID
  foreign key (OrderID)
  references Orders(OrderID) on delete cascade;

CREATE TABLE INVENTORY(
InventoryID INT PRIMARY KEY,
ProductID INT NOT NULL FOREIGN KEY(ProductID) REFERENCES Products(ProductID),
QuantityInStock INT NOT NULL,
LastStockUpdate INT NOT NULL,
);

ALTER TABLE INVENTORY ALTER COLUMN LastStockUpdate DATETIME;

--   DML    --
-- A. Insert 10 sample records
-- Inserting sample records into Customers table
INSERT INTO Customers VALUES('RANJANA','PATEL','ranjanapatel@gmail.com','0000000000','KHANDWA');
INSERT INTO Customers VALUES('SHRISTI','SHARMA','shristisharma@gmail.com','0000000001','BHOPAL');
INSERT INTO Customers VALUES('AAYUSHI','KARMA','aayushikarma@gmail.com','0000000002','KHARGONE');
INSERT INTO Customers VALUES('HIMANSHI','SAHU','himanshisahu@gmail.com','0000000003','BHOPAL');
INSERT INTO Customers VALUES('POOJA','PANDEY','poojapandey@gmail.com','0000000004','KHARGONE');
INSERT INTO Customers VALUES('TANISHA','JAIN','tanishajain@gmail.com','0000000005','REWA');
INSERT INTO Customers VALUES('SHUBHAM','PATIDAR','shubhampatidar@gmail.com','0000000006','BANGLORE');
INSERT INTO Customers VALUES('TANMAY','CHOUDHARY','tanmaychoudhary@gmail.com','0000000007','BHOPAL');
INSERT INTO Customers VALUES('NAMAN','RAGHUVANSHI','namanraghUvanshi@gmail.com','0000000008','CHENNAI');
INSERT INTO Customers VALUES('VISHESH','SINGH','visheshsingh@gmail.com','0000000009','MUMBAI');


-- Inserting sample records into Products table
INSERT INTO [dbo].[Products] VALUES(1,'HARDDISK','computer component that stores data',100);
INSERT INTO [dbo].[Products] VALUES(2,'POWER BANK','compact, battery-based device',120);
INSERT INTO [dbo].[Products] VALUES(3,'ADAPTER','compact, battery-based device',140);
INSERT INTO [dbo].[Products] VALUES(4,'USB CABLE','compact, battery-based device',160);
INSERT INTO [dbo].[Products] VALUES(5,'PEN DRIVE','compact, battery-based device',180);
INSERT INTO [dbo].[Products] VALUES(6,'EARPHONES','compact, battery-based device',200);
INSERT INTO [dbo].[Products] VALUES(7,'BLUETOOTH SPEAKER','compact, battery-based device',220);
INSERT INTO [dbo].[Products] VALUES(8,'SMARTWATCH','compact, battery-based device',240);
INSERT INTO [dbo].[Products] VALUES(9,'EARBUDS','compact, battery-based device',260);
INSERT INTO [dbo].[Products] VALUES(10,'MOUSE','compact, battery-based device',300);

-- Inserting sample records into Orders table
INSERT INTO [dbo].[Orders] VALUES(101,1,'2018-01-15',300);
INSERT INTO [dbo].[Orders] VALUES(102,2,'2018-03-20',240);
INSERT INTO [dbo].[Orders] VALUES(103,3,'2020-01-16',120);
INSERT INTO [dbo].[Orders] VALUES(104,4,'2021-02-10',420);
INSERT INTO [dbo].[Orders] VALUES(105,5,'2021-03-18',320);
INSERT INTO [dbo].[Orders] VALUES(106,6,'2022-04-11',100);
INSERT INTO [dbo].[Orders] VALUES(107,7,'2022-11-30',280);
INSERT INTO [dbo].[Orders] VALUES(108,8,'2023-01-22',720);
INSERT INTO [dbo].[Orders] VALUES(109,9,'2023-08-27',220);
INSERT INTO [dbo].[Orders] VALUES(110,10,'2023-09-01',180);

-- Inserting sample records into OrderDetails table
INSERT INTO [dbo].[OrderDetails] VALUES(1,101,10,1);
INSERT INTO [dbo].[OrderDetails] VALUES(2,102,2,2);
INSERT INTO [dbo].[OrderDetails] VALUES(3,103,2,1);
INSERT INTO [dbo].[OrderDetails] VALUES(4,104,3,3);
INSERT INTO [dbo].[OrderDetails] VALUES(5,105,4,2);
INSERT INTO [dbo].[OrderDetails] VALUES(6,106,1,1);
INSERT INTO [dbo].[OrderDetails] VALUES(7,107,3,2);
INSERT INTO [dbo].[OrderDetails] VALUES(8,108,8,3);
INSERT INTO [dbo].[OrderDetails] VALUES(9,109,7,1);
INSERT INTO [dbo].[OrderDetails] VALUES(10,110,5,1);

-- Inserting sample records into Inventory table
INSERT INTO [dbo].[INVENTORY] VALUES
(1,1,10,'2023-01-10 08:00:00'),
(2,2,20,'2023-02-15 09:30:00'),
(3,3,20,'2023-03-20 12:45:00'),
(4,4,10,'2023-01-10 08:00:00'),
(5,5,20,'2023-01-10 08:00:00'),
(6,6,30,'2023-01-10 08:00:00'),
(7,7,20,'2023-01-10 08:00:00'),
(8,8,40,'2023-01-10 08:00:00'),
(9,9,40,'2023-01-10 08:00:00'),
(10,10,50,'2023-01-10 08:00:00')
;

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM INVENTORY;


-- Q1. Write an SQL query to retrieve the names and emails of all customers.

SELECT [FirstName],[LastName],[Email] FROM Customers;

-- Q2. Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT OrderID,OrderDate,FirstName,LastName FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID = O.CustomerID;

-- Q3. Write an SQL query to insert a new customer record into the "Customers" table.
--      Include customer information such as name, email, and address.

INSERT INTO Customers VALUES ('PAWAN','SINGHA','pawansingha@gmail.com','0102913030','PUNE');

DECLARE @FirstName VARCHAR(50) = 'SHRIYA';
DECLARE @LastName VARCHAR(50) = 'GURJAR';
DECLARE @Email VARCHAR(100) = 'shriyagurjar@gmail.com';
DECLARE @Phone VARCHAR(20) = '2232435343';
DECLARE @Address VARCHAR(255) = 'BHOPAL';

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES (@FirstName, @LastName, @Email, @Phone, @Address);

-- Q4.Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

UPDATE Products SET Price=Price+Price*0.1;

-- Q5. Write an SQL query to delete a specific order and its associated order details from the 
---   "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @OrderID INT;
SET @OrderID = 101;
DELETE FROM [dbo].[OrderDetails] WHERE [OrderID]=@OrderID;
DELETE FROM [dbo].[Orders] WHERE [OrderID]=@OrderID;

-- Q6. Write an SQL query to insert a new order into the "Orders" table. 
---    Include the customer ID, order date, and any other necessary information.

DECLARE @OrderID_new INT;
SET @OrderID_new=101;
DECLARE @CustomerID INT;
SET @CustomerID=1;
DECLARE @OrderDate DATE;
SET @OrderDate='2018-01-15';
DECLARE @TotalAmount INT;
SET @TotalAmount=300;

INSERT INTO Orders VALUES(@OrderID_new,@CustomerID,@OrderDate,@TotalAmount);

-- Q7. Write an SQL query to update the contact information (e.g., email and 
--     address) of a specific customer in the "Customers" table. Allow users
--     to input the customer ID and new contact information.

DECLARE @CustomerID_new INT;
SET @CustomerID_new=1;
DECLARE @Email_new VARCHAR(100) = 'shriyagurjar@gmail.com';
DECLARE @Address_new VARCHAR(255) = 'BHOPAL';
UPDATE Customers SET [Email]=@Email_new,[Address]=@Address_new WHERE [CustomerID]=@CustomerID_new;

-- Q8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--     table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders SET TotalAmount = P.[Price]*OD.[Quantity] FROM Products AS P 
JOIN OrderDetails AS OD ON P.ProductID=OD.ProductID
WHERE OD.OrderID = Orders.OrderID;

--- Q9. Write an SQL query to delete all orders and their associated order details for a specific customer 
---     from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @C_ID INT;
SET @C_ID=4;
DELETE FROM Orders WHERE [CustomerID]=@C_ID;

--- Q10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
---      including product name, category, price, and any other relevant details.
DECLARE @Productid INT;
SET @Productid=11;
DECLARE @productname varchar(50);
SET @productname='laptop';
DECLARE @description varchar(10);
SET @description='anything';
DECLARE @price decimal(10,2);
SET @price=350;

INSERT INTO [dbo].[Products] VALUES(@Productid,@productname,@description,@price);

select * from products;

--- Q11. Write an SQL query to update the status of a specific order in the "Orders"
---      table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
Alter table Orders add status varchar(10);
update Orders set status = 'Pending' where OrderID=101;
update Orders set status = 'Pending' where OrderID=102;
update Orders set status = 'Pending' where OrderID=103;
update Orders set status = 'Pending' where OrderID=105;
update Orders set status = 'Shipped' where OrderID=106;
update Orders set status = 'Shipped' where OrderID=107;
update Orders set status = 'Shipped' where OrderID=108;
update Orders set status = 'Shipped' where OrderID=109;
update Orders set status = 'Pending' where OrderID=110;
select * from orders;

declare @oid int;
set @oid = 101;
declare @newstatus varchar(10)='Shipped';
update Orders set status=@newstatus where OrderID=@oid;

-- Joins

-- Q1. Write an SQL query to retrieve a list of all orders along with
--     customer information (e.g., customer name) for each order.

SELECT [FirstName],[LastName],[OrderID],[OrderDate],[TotalAmount],[status] FROM Orders AS O 
JOIN Customers AS C ON O.CustomerID = C.CustomerID;

--- Q2. Write an SQL query to find the total revenue generated by each 
---     electronic gadget product. Include the product name and the total revenue.

SELECT P.ProductID,ProductName,SUM(Price * Quantity) AS TotalRevenue FROM OrderDetails AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName;

--- Q3. Write an SQL query to list all customers who have made at least one purchase. 
---     Include their names and contact information.

SELECT C.CustomerID,FirstName,LastName,C.Email,C.Phone,C.Address FROM Customers AS C
JOIN Orders AS O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,C.FirstName,C.LastName,C.Email,C.Phone,C.Address;

--- 4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest total quantity ordered. Include the product name and the total quantity ordered.
SELECT Products.ProductName,SUM(OrderDetails.Quantity) AS TotalQuantityOrdered FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC 
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--- 6. Write an SQL query to calculate the average order value for each customer. Include the customer's name and their average order value.
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

--- 7. Write an SQL query to find the order with the highest total revenue. Include the order ID, customer information, and the total revenue.
SELECT
    Orders.OrderID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    SUM(Products.Price * OrderDetails.Quantity) AS TotalRevenue
FROM
    Orders
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY
    Orders.OrderID, Customers.FirstName, Customers.LastName, Orders.OrderDate
ORDER BY
    TotalRevenue DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--- 8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.
SELECT
    Products.ProductID,
    Products.ProductName,
    COUNT(OrderDetails.OrderID) AS OrderCount
FROM
    Products
LEFT JOIN
    OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY
    Products.ProductID, Products.ProductName
ORDER BY
    OrderCount DESC;

--- 9. Write an SQL query to find customers who have purchased a specific electronic gadget product. Allow users to input the product name as a parameter.
DECLARE @ProductName VARCHAR(100) = 'POWER BANK';

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email,
    Customers.Phone,
    Customers.Address
FROM
    Customers
JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Products.ProductName = @ProductName;

--- 10. Write an SQL query to calculate the total revenue generated by all orders placed within a specific time period. Allow users to input the start and end dates as parameters.
DECLARE @StartDate DATE = '2020-12-02';
DECLARE @EndDate DATE = '2022-12-02';

SELECT
    SUM(Products.Price * OrderDetails.Quantity) AS TotalRevenue
FROM
    Orders
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    Orders.OrderDate BETWEEN @StartDate AND @EndDate;

--- 5. Aggregate Functions and Subqueries:
--- 1. Write an SQL query to find out which customers have not placed any orders.
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email,
    Customers.Phone,
    Customers.Address
FROM
    Customers
LEFT JOIN
    Orders ON Customers.CustomerID = Orders.CustomerID
WHERE
    Orders.OrderID IS NULL;

--- 2. Write an SQL query to find the total number of products available for sale.

SELECT COUNT(ProductID) AS TotalProducts FROM Products;

--- 3. Write an SQL query to calculate the total revenue generated by TechShop.

SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders;

--- 5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter.
DECLARE @CusID INT = '5';
SELECT SUM(Orders.TotalAmount) AS TotalRevenue FROM Orders
WHERE Orders.CustomerID = @CuSID;

--- 6. Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.
select c.customerid, count(o.customerid) AS NumberOfOrders 
from customers c inner join orders o on c.customerid=o.customerid  group by(c.customerid);


--- 8. Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.

SELECT C.CustomerID,FirstName,LastName,SUM(Price * Quantity) AS TotalSpending FROM Customers as C
JOIN Orders as O ON C.CustomerID = O.CustomerID
JOIN OrderDetails as OD ON O.OrderID = OD.OrderID
JOIN Products as P ON OD.ProductID = P.ProductID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpending DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY;

--- 9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers.
SELECT C.CustomerID,FirstName,LastName,AVG(TotalAmount) AS AverageOrderValue
FROM  Customers as C
LEFT JOIN Orders as O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

--- 10. Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.
SELECT C.CustomerID,FirstName,LastName,COUNT(OrderID) AS OrderCount
FROM Customers as C
LEFT JOIN Orders as O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;


USE OnlineSales;

CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,5),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    UserName VARCHAR(30) UNIQUE,
    MemberShipStartDate DATETIME,
    CONSTRAINT PK_CUSTOMER PRIMARY KEY (CustomerID)
);

INSERT INTO Customer (FirstName, LastName, UserName, MemberShipStartDate)
VALUES 
('Alice', 'Smith', 'alicesmith', '2023-01-15'),
('Bob', 'Johnson', 'bobjohnson', '2023-02-20'),
('Charlie', 'Brown', 'charliebrown', '2023-03-10');


CREATE TABLE AddressType (
    AddressTypeID TINYINT,
    Name VARCHAR(20) NOT NULL,
    CONSTRAINT PK_ADDRESS_TYPE PRIMARY KEY (AddressTypeID)
);

INSERT INTO AddressType (AddressTypeID, Name)
VALUES 
(1, 'Home'),
(2, 'Work'),
(3, 'Billing');


CREATE TABLE CustomerAddress (
    CustomerAddressID INT IDENTITY(1,5),
    CustomerID INT NOT NULL,
    AddressTypeID TINYINT NOT NULL,
    AddressLine1 VARCHAR(50) NOT NULL,
    City VARCHAR(30),
    Province CHAR(2),
    CONSTRAINT PK_CUSTOMER_ADDRESS PRIMARY KEY (CustomerAddressID),
    CONSTRAINT FK_CustomerAddress_Customer FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    CONSTRAINT FK_CustomerAddress_AddressType FOREIGN KEY (AddressTypeID) REFERENCES AddressType (AddressTypeID)
);

INSERT INTO CustomerAddress (CustomerID, AddressTypeID, AddressLine1, City, Province)
VALUES 
(1, 1, '123 Maple St', 'Vancouver', 'BC'),  
(6, 2, '456 Oak Ave', 'Toronto', 'ON'),     
(11, 1, '789 Pine Rd', 'Montreal', 'QC'),    
(16, 3, '101 Elm Dr', 'Montreal', 'QC');


CREATE TABLE Orders (
    OrderID BIGINT IDENTITY(1000, 3),
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    CONSTRAINT FK_Orders_Customer FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID),
    CONSTRAINT PK_ORDERS PRIMARY KEY (OrderID)
);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
(1, '2023-10-01'), 
(6, '2023-10-02'),  
(11, '2023-10-03'); 


CREATE TABLE Shipment (
    ShipmentID BIGINT IDENTITY(1,1),
    OrderID BIGINT NOT NULL,
    CustomerAddressID INT NOT NULL,
    ShipmentDate DATETIME,
    CONSTRAINT PK_SHIPMENT PRIMARY KEY (ShipmentID),
    CONSTRAINT FK_Shipment_CustomerAddress FOREIGN KEY (CustomerAddressID) REFERENCES CustomerAddress (CustomerAddressID),
    CONSTRAINT FK_Shipment_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

INSERT INTO Shipment (OrderID, CustomerAddressID, ShipmentDate)
VALUES 
(1000, 1, '2023-10-04'),  
(1003, 2, '2023-10-05'),  
(1006, 3, '2023-10-06');  


CREATE TABLE Product (
    ProductID INT IDENTITY(3000, 2),
    ProductName VARCHAR(50) UNIQUE NOT NULL,
    ShortDesc VARCHAR(50) NOT NULL,
    Price DECIMAL(5, 2) NOT NULL,
    QuantityInStock INT DEFAULT 0,
    CONSTRAINT PK_PRODUCTID PRIMARY KEY (ProductID)
);

INSERT INTO Product (ProductName, ShortDesc, Price, QuantityInStock)
VALUES 
('Laptop', 'Gaming Laptop', 1299.99, 50),
('Headphones', 'Noise-Cancelling Headphones', 199.99, 150),
('Mouse', 'Wireless Mouse', 49.99, 100);


CREATE TABLE OrderDetails (
    OrderDetailsID BIGINT IDENTITY(1, 1),
    OrderID BIGINT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,
    CONSTRAINT PK_ORDER_DETAILS_ID PRIMARY KEY (OrderDetailsID),
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    CONSTRAINT FK_OrderDetails_Product FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1000, 3000, 1),  
(1003, 3002, 2), 
(1006, 3004, 3); 

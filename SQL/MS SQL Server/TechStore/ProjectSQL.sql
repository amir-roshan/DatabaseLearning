CREATE DATABASE TechStoreDB;

USE TechStoreDB;

CREATE TABLE Customers(
	CustomerID INT NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL UNIQUE,
	ContactNumber VARCHAR(15) NOT NULL,
    CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, ContactNumber) 
VALUES
	(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890'),
	(2, 'Jane', 'Doe', 'jane.doe@example.com', '123-456-7891'),
	(3, 'Jim', 'Beam', 'jim.beam@example.com', '123-456-7892'),
	(4, 'Jill', 'Valentine', 'jill.valentine@example.com', '123-456-7893'),
	(5, 'Chris', 'Redfield', 'chris.redfield@example.com', '123-456-7894'),
	(6, 'Albert', 'Wesker', 'albert.wesker@example.com', '123-456-7895'),
	(7, 'Claire', 'Redfield', 'claire.redfield@example.com', '123-456-7896'),
	(8, 'Leon', 'Kennedy', 'leon.kennedy@example.com', '123-456-7897'),
	(9, 'Ada', 'Wong', 'ada.wong@example.com', '123-456-7898'),
	(10, 'Bruce', 'Wayne', 'bruce.wayne@example.com', '123-456-7899');


CREATE TABLE Province (
	ProvinceID INT NOT NULL,
	ProvinceName VARCHAR(50) NOT NULL UNIQUE,
	ProvinceCode VARCHAR(2) NOT NULL UNIQUE,
	CONSTRAINT PK_Province PRIMARY KEY (ProvinceID),
)

INSERT INTO Province (ProvinceID, ProvinceName, ProvinceCode) 
VALUES
    (1, 'Alberta', 'AB'),
    (2, 'British Columbia', 'BC'),
    (3, 'Manitoba', 'MB'),
    (4, 'New Brunswick', 'NB'),
    (5, 'Newfoundland and Labrador', 'NL'),
    (6, 'Northwest Territories', 'NT'),
    (7, 'Nova Scotia', 'NS'),
    (8, 'Nunavut', 'NU'),
    (9, 'Ontario', 'ON'),
    (10, 'Prince Edward Island', 'PE'),
    (11, 'Quebec', 'QC'),
    (12, 'Saskatchewan', 'SK'),
    (13, 'Yukon', 'YT');


CREATE TABLE Address (
    AddressID INT NOT NULL,
    Street VARCHAR(100),
    City VARCHAR(50),
    province VARCHAR(50),
    PostalCode VARCHAR(20),
	CustomerID INT NOT NULL,
	ProvinceID INT NOT NULL,
    CONSTRAINT PK_Address PRIMARY KEY (AddressID),
    CONSTRAINT FK_Address_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_Address_Province FOREIGN KEY (ProvinceID) REFERENCES Province(ProvinceID)
);

INSERT INTO Address (AddressID, Street, City, PostalCode, CustomerID, ProvinceID) 
VALUES
    (1, '123 Main St', 'Toronto', 'M5B 1L7', 1, 9),  
    (2, '124 Main St', 'Toronto', 'M5B 1L8', 2, 9),  
    (3, '125 Main St', 'Vancouver', 'V5K 0A1', 3, 2),
    (4, '126 Main St', 'Vancouver', 'V5K 0A2', 4, 2),
    (5, '127 Main St', 'Calgary', 'T2P 1J9', 5, 1),  
    (6, '128 Main St', 'Calgary', 'T2P 1K0', 6, 1),  
    (7, '129 Main St', 'Edmonton', 'T5J 1E3', 7, 1), 
    (8, '130 Main St', 'Edmonton', 'T5J 1E4', 8, 1), 
    (9, '131 Main St', 'Ottawa', 'K1P 1J1', 9, 9),   
    (10, '132 Main St', 'Ottawa', 'K1P 1J2', 10, 9); 



CREATE TABLE OrderStatus (
    OrderStatusID INT NOT NULL,
    StatusName VARCHAR(50) NOT NULL,
    Description VARCHAR(255),
    CONSTRAINT PK_OrderStatus PRIMARY KEY (OrderStatusID)
);

INSERT INTO OrderStatus (OrderStatusID, StatusName, Description) 
VALUES
	(1, 'Pending', 'Order has been placed and is awaiting processing'),
	(2, 'Processing', 'Order is currently being processed'),
	(3, 'Shipped', 'Order has been shipped to the customer'),
	(4, 'Delivered', 'Order has been delivered to the customer'),
	(5, 'Cancelled', 'Order was cancelled by the customer or store');



CREATE TABLE Orders (
    OrderID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderStatusID INT NOT NULL,
    CustomerID INT NOT NULL,
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID),
    CONSTRAINT FK_Orders_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	CONSTRAINT FK_Orders_OrderStatus FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID)
);

INSERT INTO Orders (OrderID, OrderDate, OrderStatusID, CustomerID) 
VALUES
	(1, '2023-11-01', 1, 1),
	(2, '2023-11-02', 2, 2),
	(3, '2023-11-02', 3, 3),
	(4, '2023-11-03', 4, 4),
	(5, '2023-11-04', 5, 5),
	(6, '2023-11-05', 1, 6);



CREATE TABLE Products (
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),
    StockQuantity INT NOT NULL CHECK (StockQuantity >= 0),
    CONSTRAINT PK_Product PRIMARY KEY (ProductID)
);

INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity) VALUES
(101, '256GB Solid State Drive', 'Fast SSD with 256GB storage capacity, suitable for boot drives', 79.99, 50),
(102, '1TB Hard Drive', '1TB HDD with 7200 RPM, ideal for archival storage', 49.99, 40),
(103, '16GB DDR4 RAM', 'High-speed DDR4 memory module, 3200 MHz', 89.99, 70),
(104, 'NVIDIA RTX 3080', 'High-end gaming graphics card with 10GB of GDDR6X memory', 699.99, 30),
(105, 'AMD Ryzen 5 5600X', '6-core 12-thread processor with a boost clock of up to 4.6 GHz', 299.99, 25),
(106, '650W Power Supply', '650 watts power supply unit with 80+ Bronze certification', 74.99, 60),
(107, 'ATX Motherboard', 'Motherboard with support for up to 128GB DDR4, PCIe 4.0, and USB 3.2', 199.99, 45),
(108, '27-inch Gaming Monitor', '27-inch 144Hz gaming monitor with QHD resolution and 1ms response time', 329.99, 20),
(109, 'Mechanical Keyboard', 'RGB backlit mechanical gaming keyboard with Cherry MX switches', 119.99, 50),
(110, 'Gaming Mouse', 'Ergonomic gaming mouse with up to 16000 DPI and 8 programmable buttons', 59.99, 80);



CREATE TABLE OrderDetails (
    OrderDetailID INT NOT NULL,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity TINYINT NOT NULL,
    CONSTRAINT PK_OrderDetails PRIMARY KEY (OrderDetailID),
    CONSTRAINT FK_OrderDetails_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT FK_OrderDetails_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 101, 2),
(2, 1, 102, 1),
(3, 2, 103, 3),
(4, 3, 104, 1),
(5, 4, 105, 1),
(6, 5, 106, 2),
(7, 6, 101, 1),
(8, 6, 107, 3);

USE sql_store; -- the SQL keywords should be in uppercase

-- Select all the columns from the customer table - This statement has two cluases.
SELECT * FROM customers; 

-- All the clauses are optional 
-- The order of the clauses matter
-- Looking for the customer with an ID of 1 and order the customer by the first name
SELECT * 
FROM customers 
WHERE customer_id = 1
ORDER BY first_name; 

-- The SELECT clause
-- The column order matters => first name first
-- AS is used to rename a column or table with an alias
SELECT 
	first_name, 
	last_name, 
    points,
	(points + 10) * 100 AS 'discount factor' 
FROM customers;

-- DISTINCT is used to retrieve the unique data.
SELECT DISTINCT state FROM customer;

-- The WHERE Clause
-- != is the same as <>
SELECT * FROM customers WHERE points > 3000;
SELECT * FROM customers WHERE state <> 'VA';
SELECT * FROM customers WHERE birth_date > '1990-01-01';

-- The AND, OR and NOT Operators
SELECT * FROM Customers WHERE 
	birth_date > '1990-01-01' OR 
	(points > 100 AND state = 'VA');
    
SELECT * FROM Customers WHERE 
	birth_date > '1990-01-01' OR NOT (points < 1000);
    
-- The IN Operator
-- We can use the in operator instead of the multiple or operators 
SELECT * FROM customers WHERE state NOT IN('VA', 'FL', 'GA');

-- The BETWEEN Operator
SELECT * FROM customers WHERE points BETWEEN 1000 AND 3500;
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

-- The LIKE operator
-- the last name of all the customers starts with b
-- and there can be any number of characters after b
-- it does not matter if b is upper case or lower case
SELECT * FROM customers WHERE last_name LIKE 'b%';

-- b is in somewhere in the midde or the beginning or at the end
SELECT * FROM customers WHERE last_name LIKE '%b%';

-- ends with y
SELECT * FROM customers WHERE last_name LIKE '%y';

-- the lastname should be 5 chars and the last one should be y
SELECT * FROM customers WHERE last_name LIKE '____y';

-- % any number of characters 
-- _ single number of character
-- LIKE is an older operator

-- ----------------------------------------

-- The REGEXP Operator
-- The last name ends with field.
SELECT * FROM customers WHERE last_name REGEXP 'field';

-- The last name must start with a field which is represented by carrot sign (^)
SELECT * FROM customers WHERE last_name REGEXP '^field';

-- The last name must start with a field or ends with mac or rose
SELECT * FROM customers WHERE last_name REGEXP '^field|mac|rose';

-- There is 'e' in the customer's last name => ge, ie, me
SELECT * FROM customers WHERE last_name REGEXP '[gim]e';

-- eq
SELECT * FROM customers WHERE last_name REGEXP 'e[q]';

-- Any chars from A - H before the letter e.
SELECT * FROM customers WHERE last_name REGEXP '[a-h]e';

-- ^ => Beginning 
-- $ => End ("roshan$")
-- | => Logical or
-- [abcd] => targetting specific chars
-- [a-f] => representing chars with a range 

-- ----------------------------------------
 
-- The IS NULL Operator 
-- Customers who don't have any phone number	
SELECT * FROM customers WHERE phone IS NULL;

-- Customers who have a phone number	
SELECT * FROM customers WHERE phone IS NOT NULL;

-- ----------------------------------------

-- The ORDER BY Clause
-- In relation databases every table should have a primary key column
-- By defualt the every table is sorted by the primary key column
SELECT * FROM customers ORDER BY first_name;

-- Order by descending
SELECT * FROM customers ORDER BY first_name DESC;

-- Order by state then first name
SELECT * FROM customers ORDER BY state, first_name DESC;

-- These queries are valid in MySQL
SELECT first_name, last_name FROM customers ORDER BY birth_date;
SELECT first_name, last_name, 10 AS points FROM customers ORDER BY points;

SELECT first_name, last_name FROM customers ORDER BY 2, 1;

-- ----------------------------------------

-- The LIMIT Clause
-- Return the first 3 customers
-- if the limit number is larger than the actual number of cutsomer it will return all of the customers
-- The LIMIT clause should always come at the end
SELECT * FROM customers LIMIT 3; 

-- The number 6 in here is the offset which tells MySQL to ignores the first 6 records
SELECT * FROM customers LIMIT 6, 3; 

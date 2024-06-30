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
SELECT first_name, last_name, point
FROM customers


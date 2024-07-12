-- Return all the products
--  name
--  unit price
--  new price (unit price * 1.1)
SELECT 
	name,
    unit_price,
	unit_price * 1.1 AS 'new unit price'
FROM products;


-- Get the orders placed this year
SELECT * FROM orders WHERE YEAR(order_date) = 2019;
-- OR
SELECT * FROM orders WHERE order_date >= '2019-01-01';


-- From the order_items table, get the items for order #6 
-- Where the total price is greater than 30.
SELECT * FROM order_items WHERE order_id = 6 AND unit_price * quantity > 30; 


-- Return products with
-- 		quantity in stock equal to 49, 38, 72
SELECT * FROM products WHERE quantity_in_stock IN (49, 38, 72);

-- Rturn customer born 
-- 		between 1/1/1990 and 1/1/2000
SELECT * FROM customers WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';


-- Get the customers whose 
-- 		addressess contain TRAIL or AVENUE 
-- 		phone numbers end with 9 
SELECT * FROM customers WHERE (address LIKE '%trail%' OR  address LIKE '%avenue%') AND phone LIKE "%9";
SELECT * FROM customers;


-- Get the Customers whose 
-- 		First names are ELKA or AMBUR
SELECT * FROM customers WHERE first_name REGEXP ("elka|ambur");
-- 		Last names end with EY or ON
SELECT * FROM customers WHERE last_name REGEXP ("ey$|on$");
-- 		Last names start with MY or contains SE
SELECT * FROM customers WHERE last_name REGEXP ("^my|^se");
-- 		Last names contain B followed by R or U
SELECT * FROM customers WHERE last_name REGEXP ("b[ru]");


-- Get the orders that are not shipped
SELECT * FROM orders WHERE shipped_date IS NULL;


-- Order the items by their total price from the order_items and the order id of 2
-- AS => alias which means AKA
SELECT * , quantity * unit_price AS total_price
FROM order_items
WHERE order_id = 2 
ORDER BY total_price DESC;


-- Get the top 3 loayal customers
SELECT * FROM customers
ORDER BY points DESC
LIMIT 3;

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
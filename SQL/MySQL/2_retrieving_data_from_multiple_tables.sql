-- INNER JOINS
-- We usually select columns from a multiple tables
-- The inner keyword is optional 
-- orders o => o is an alias, the same concept applies to customers c
SELECT order_id, o.customer_id, first_name, last_name 
FROM orders o 
INNER JOIN customers c
	ON o.customer_id = c.customer_id;


-- The left table is returned whether the condition is true or not
-- FROM table is the left table (customers)
-- The OUTER keyword is OPTIONAL just like the INNER keyword
SELECT 
	c.customer_id,
    c.first_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;


-- USING clause must have the same column name
SELECT 
	o.order_id,
    c.first_name,
    sh.name AS shipper
FROM orders o
JOIN customers c
	-- ON o.customer_id = c.customer_id
    USING (customer_id)
LEFT JOIN shippers sh
	USING (shipper_id);
    
SELECT *
FROM order_items oi
	JOIN order_item_notes oin
    -- ON oi.order_id = oin.order_Id AND oi.product_id = oin.product_id
    USING(order_id, product_id)
products

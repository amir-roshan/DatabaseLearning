SELECT order_id, oi.product_id, quantity, oi.unit_price, p.name 
FROM order_items oi
JOIN products p 
	ON oi.order_id = p.product_id;
    
SELECT 
	p.product_id,
    p.name,
    oi.order_id
FROM order_items oi
RIGHT JOIN products p 
	ON oi.product_id = p.product_id
ORDER BY p.product_id;


-- Joining multiple tables with the left join
SELECT 
	o.order_date,
    o.order_id,
    c.first_name AS customer, 
    sh.name AS shipper,
    os.name AS status
FROM orders o
JOIN customers c
	ON o.customer_id = c.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY status
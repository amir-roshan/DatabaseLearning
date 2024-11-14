SELECT 
	c.FirstName + ' ' + c.LastName AS FullName,
	c.Email,
	a.City,
	p.ProvinceCode AS Province,
	o.OrderDate,
	os.StatusName AS Status
FROM Orders o
JOIN OrderStatus os
ON o.OrderStatusID = os.OrderStatusID
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Address a
ON c.CustomerID = a.AddressID
JOIN Province p
ON p.ProvinceID = a.ProvinceID
WHERE os.StatusName = 'pending';
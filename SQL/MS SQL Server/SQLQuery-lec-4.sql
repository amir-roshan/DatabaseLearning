SELECT *
FROM [AdventureWorks2022].[HumanResources].[Employee] AS e
WHERE e.Gender = 'M'
UNION
SELECT *
FROM [AdventureWorks2022].[HumanResources].[Employee] AS e
WHERE e.Gender = 'F';

------------------------------------------

SELECT MAX(HireDate) AS total_records
FROM [AdventureWorks2022].[HumanResources].[Employee];

SELECT COUNT(*) AS total_males
FROM [AdventureWorks2022].[HumanResources].[Employee] AS e
WHERE e.Gender = 'M';

SELECT COUNT(*) AS total_females
FROM [AdventureWorks2022].[HumanResources].[Employee] AS e
WHERE e.Gender = 'F';

------------------------------------------

SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName
FROM [AdventureWorks2022].[Person].[Person] AS p;

SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName
FROM [AdventureWorks2022].[Person].[Person] AS p
ORDER BY p.FirstName;

SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName
FROM [AdventureWorks2022].[Person].[Person] AS p
ORDER BY p.LastName DESC;

SELECT 
	p.BusinessEntityID,
	p.FirstName,
	p.LastName
FROM [AdventureWorks2022].[Person].[Person] AS p
ORDER BY FirstName, LastName DESC;

------------------------------------------

SELECT *
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory] AS edh
JOIN [AdventureWorks2022].[HumanResources].[Shift] AS sh
	ON edh.ShiftID = sh.ShiftID;

SELECT 
	edh.BusinessEntityID,
	edh.DepartmentID,
	sh.Name AS "Shift Type"
FROM [AdventureWorks2022].[HumanResources].[EmployeeDepartmentHistory] AS edh
JOIN [AdventureWorks2022].[HumanResources].[Shift] AS sh
	ON edh.ShiftID = sh.ShiftID;

------------------------------------------

SELECT 
	p.BusinessEntityID,
	p.FirstName + ' ' + p.LastName AS "Full Name"
FROM [AdventureWorks2022].[Person].[Person] AS p;

SELECT 
	p.BusinessEntityID,
	CONCAT(p.FirstName, '-', p.LastName) AS "Full Name"
FROM [AdventureWorks2022].[Person].[Person] AS p;

SELECT 
	a.AddressLine1,
	a.City,
	SUBSTRING(a.PostalCode, 1, 3) AS "First Three Chars"
FROM [AdventureWorks2022].[Person].[Address] AS a
WHERE a.StateProvinceID = 57;
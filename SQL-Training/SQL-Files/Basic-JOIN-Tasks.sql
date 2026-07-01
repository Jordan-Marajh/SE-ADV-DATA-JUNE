USE Northwind;

-- 1. -------------------------------

--SELECT
--    c.CompanyName,
--    o.OrderID,
--    o.OrderDate
--FROM Customers AS c
--JOIN Orders AS o
--    ON c.CustomerID = o.CustomerID;

-------------------------------------

-- 2. -------------------------------

--SELECT TOP 10 * FROM [Order Details];

--SELECT
--    od.OrderID,
--    p.ProductName
--FROM [Order Details] od
--JOIN Products p
--    ON od.ProductID = p.ProductID;

-------------------------------------

-- 3. -------------------------------

--SELECT
--    OrderID,
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS "Order Total"
--FROM [Order Details]
--GROUP BY OrderID;

-------------------------------------

-- 4. -------------------------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    COUNT(DISTINCT o.OrderID) AS NumberOfOrders,
--    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSpend
--FROM Customers AS c
--JOIN Orders AS o
--    ON c.CustomerID = o.CustomerID
--JOIN [Order Details] AS od
--    ON o.OrderID = od.OrderID
--GROUP BY c.CustomerID, c.CompanyName;

-------------------------------------

-- 5. -------------------------------

--SELECT TOP 5
--    c.CustomerID,
--    c.CompanyName,
--    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSpend
--FROM Customers AS c
--JOIN Orders AS o
--    ON c.CustomerID = o.CustomerID
--JOIN [Order Details] AS od
--    ON o.OrderID = od.OrderID
--GROUP BY c.CustomerID, c.CompanyName
--ORDER BY TotalSpend DESC;

-------------------------------------

-- 6. -------------------------------

--SELECT
--    c.CompanyName
--FROM Customers AS c
--LEFT JOIN Orders AS o
--    ON c.CustomerID = o.CustomerID
--WHERE o.OrderID IS NULL;

-------------------------------------

-- 7. -------------------------------

--SELECT
--  o.OrderID,
--  c.CompanyName,
--  e.FirstName + ' ' + e.LastName AS EmployeeName
--FROM Orders o
--JOIN Customers c
--	ON o.CustomerID = c.CustomerID
--JOIN Employees e
--  ON o.EmployeeID = e.EmployeeID;

-------------------------------------

-- 8. -------------------------------

--SELECT
--    cat.CategoryName,
--    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalSales
--FROM Categories AS cat
--JOIN Products AS p
--    ON cat.CategoryID = p.CategoryID
--JOIN [Order Details] AS od
--    ON p.ProductID = od.ProductID
--GROUP BY cat.CategoryName;

-------------------------------------
USE Northwind;

-- 1. -------------------------------

--SELECT
--    p.ProductID,
--    p.ProductName
--FROM Products p
--LEFT JOIN [Order Details] od
--    ON od.ProductID = p.ProductID
--WHERE od.ProductID IS NULL;

-------------------------------------

-- 2. -------------------------------

--SELECT
--    o.OrderID,
--    c.CompanyName AS CustomerName,
--    p.ProductName,
--    od.Quantity,
--    od.UnitPrice,
--    od.Discount,
--    od.Quantity * od.UnitPrice * (1 - od.Discount) AS Total
--FROM Orders o
--JOIN Customers c
--    ON o.CustomerID = c.CustomerID
--JOIN [Order Details] od
--    ON o.OrderID = od.OrderID
--JOIN Products p
--    ON od.ProductID = p.ProductID;

-------------------------------------

-- 3. -------------------------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    COUNT(DISTINCT o.OrderID) AS NumberOfOrders,
--    COALESCE(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 0) AS TotalSpend,
--    COALESCE(
--        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) / NULLIF(COUNT(DISTINCT o.OrderID), 0),
--        0
--    ) AS AverageOrderValue
--FROM Customers c
--LEFT JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--LEFT JOIN [Order Details] od
--    ON o.OrderID = od.OrderID
--GROUP BY c.CustomerID, c.CompanyName;

-------------------------------------

-- 4. -------------------------------

--SELECT TOP 1 WITH TIES
--    p.ProductID,
--    p.ProductName,
--    SUM(od.Quantity) AS TotalQuantityOrdered
--FROM Products p
--JOIN [Order Details] od
--    ON p.ProductID = od.ProductID
--GROUP BY p.ProductID, p.ProductName
--ORDER BY TotalQuantityOrdered DESC;

-------------------------------------

-- 5. -------------------------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    SUM(CASE WHEN YEAR(o.OrderDate) = 1996 THEN 1 ELSE 0 END) AS OrdersIn1996,
--    SUM(CASE WHEN YEAR(o.OrderDate) = 1997 THEN 1 ELSE 0 END) AS OrdersIn1997
--FROM Customers c
--LEFT JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--GROUP BY c.CustomerID, c.CompanyName
--HAVING SUM(CASE WHEN YEAR(o.OrderDate) = 1997 THEN 1 ELSE 0 END)
--     < SUM(CASE WHEN YEAR(o.OrderDate) = 1996 THEN 1 ELSE 0 END);

-------------------------------------

-- 6. -------------------------------

--SELECT TOP 10
--    p1.ProductName AS Product1,
--    p2.ProductName AS Product2,
--    COUNT(*) AS TimesOrderedTogether
--FROM [Order Details] od1
--JOIN [Order Details] od2
--    ON od1.OrderID = od2.OrderID
--   AND od1.ProductID < od2.ProductID
--JOIN Products p1
--    ON od1.ProductID = p1.ProductID
--JOIN Products p2
--    ON od2.ProductID = p2.ProductID
--GROUP BY p1.ProductName, p2.ProductName
--ORDER BY TimesOrderedTogether DESC;

-------------------------------------

-- 7. -------------------------------

--SELECT
--    t.TerritoryDescription AS TerritoryName,
--    COUNT(DISTINCT et.EmployeeID) AS EmployeeCount,
--    COALESCE(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 0) AS Revenue
--FROM Territories t
--LEFT JOIN EmployeeTerritories et
--    ON t.TerritoryID = et.TerritoryID
--LEFT JOIN Employees e
--    ON et.EmployeeID = e.EmployeeID
--LEFT JOIN Orders o
--    ON e.EmployeeID = o.EmployeeID
--LEFT JOIN [Order Details] od
--    ON o.OrderID = od.OrderID
--GROUP BY t.TerritoryID, t.TerritoryDescription;

-------------------------------------

USE Northwind;

-- 1. -------------------------------

--SELECT 
--    c.ContactName, 
--    COUNT(o.OrderID) AS TotalOrders
--FROM Orders o
--JOIN Customers c
--	ON o.CustomerID = c.CustomerID
--GROUP BY o.CustomerID,c.ContactName;

-------------------------------------

-- 2. -------------------------------

--SELECT
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
--FROM [Order Details];

-------------------------------------

-- 3. -------------------------------

--SELECT
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
--FROM [Order Details]
--GROUP BY OrderID;

-------------------------------------

-- 4. -------------------------------

--SELECT 
--    c.CustomerID,
--    c.CompanyName,
--    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalRevenue
--FROM [Order Details] as od
--JOIN Orders o
--    ON od.OrderID = o.OrderID
--JOIN Customers c
--    ON c.CustomerID = o.CustomerID
--GROUP BY c.CustomerID, c.CompanyName;

-------------------------------------

-- 5. -------------------------------

--SELECT COUNT(*) AS TotalProducts FROM Products;

-------------------------------------

-- 6. -------------------------------

--SELECT TOP 1 WITH TIES
--    ProductID,
--    ProductName,
--    MAX(UnitPrice) AS MostExpensivePrice
--FROM Products
--GROUP BY ProductID, ProductName
--ORDER BY MAX(UnitPrice) DESC;

--SELECT TOP 1 WITH TIES
--    ProductID,
--    ProductName,
--    UnitPrice AS MostExpensivePrice
--FROM Products
--ORDER BY UnitPrice DESC;

-------------------------------------

-- 7. -------------------------------

--SELECT
--	p.ProductName,
--	od.ProductID,
--	SUM(od.Quantity) AS TotalSold
--FROM [Order Details] od
--JOIN Products p
--	ON p.ProductID = od.ProductID
--GROUP BY od.ProductID, p.ProductName;

-------------------------------------

-- 8. -------------------------------

SELECT TOP 10 * FROM Customers;
SELECT TOP 10 * FROM Orders;

SELECT (WHEN COUNT(CustomerID) > 5) FROM Customers; 

-------------------------------------

-- 9. -------------------------------



-------------------------------------
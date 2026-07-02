USE Northwind;

-- Aggregation Practice -------------------------------

-- 1. Orders per customer ------------------------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    COUNT(o.OrderID) AS TotalOrders
--FROM Customers c
--LEFT JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--GROUP BY c.CustomerID, c.CompanyName;

-------------------------------------

-- 2. Total Revenue (whole database) -------------------

--SELECT
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
--FROM [Order Details];

-------------------------------------

-- 3. Revenue per order --------------------------------

--SELECT
--    OrderID,
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderRevenue
--FROM [Order Details]
--GROUP BY OrderID;

-------------------------------------

-- 4. Revenue per customer -----------------------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalRevenue
--FROM Customers c
--JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--JOIN [Order Details] od
--    ON o.OrderID = od.OrderID
--GROUP BY c.CustomerID, c.CompanyName;

-------------------------------------

-- 5. Count total number of products -------------------

--SELECT
--    COUNT(*) AS TotalProducts
--FROM Products;

-------------------------------------

-- 6. Find the most expensive product ------------------

--SELECT TOP 1 WITH TIES
--    ProductID,
--    ProductName,
--    UnitPrice AS MostExpensivePrice
--FROM Products
--ORDER BY UnitPrice DESC;

-------------------------------------

-- 7. Total quantity sold per product ------------------

--SELECT
--    p.ProductID,
--    p.ProductName,
--    SUM(od.Quantity) AS TotalQuantitySold
--FROM Products p
--JOIN [Order Details] od
--    ON p.ProductID = od.ProductID
--GROUP BY p.ProductID, p.ProductName;

-------------------------------------

-- 8. Customers who made more than 5 orders ------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    COUNT(o.OrderID) AS TotalOrders
--FROM Customers c
--JOIN Orders o
--    ON c.CustomerID = o.CustomerID
--GROUP BY c.CustomerID, c.CompanyName
--HAVING COUNT(o.OrderID) > 5;

-------------------------------------

-- 9. Top 3 orders by total value ----------------------

--SELECT TOP 3
--    OrderID,
--    SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--FROM [Order Details]
--GROUP BY OrderID
--ORDER BY OrderTotal DESC;

-------------------------------------


-- Subqueries Practice -------------------------------

-- 1. Products above avg price -------------------------

--SELECT
--    ProductID,
--    ProductName,
--    UnitPrice
--FROM Products
--WHERE UnitPrice > (
--    SELECT AVG(UnitPrice)
--    FROM Products
--);

-------------------------------------

-- 2. Orders above avg order value ---------------------

--SELECT
--    OrderID,
--    OrderTotal
--FROM (
--    SELECT
--        OrderID,
--        SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--    FROM [Order Details]
--    GROUP BY OrderID
--) OrderTotals
--WHERE OrderTotal > (
--    SELECT AVG(OrderTotal)
--    FROM (
--        SELECT
--            OrderID,
--            SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--        FROM [Order Details]
--        GROUP BY OrderID
--    ) AllOrderTotals
--);

-------------------------------------

-- 3. Customers with more than 5 orders ----------------

--SELECT
--    c.CustomerID,
--    c.CompanyName,
--    (
--        SELECT COUNT(*)
--        FROM Orders o
--        WHERE o.CustomerID = c.CustomerID
--    ) AS TotalOrders
--FROM Customers c
--WHERE (
--    SELECT COUNT(*)
--    FROM Orders o
--    WHERE o.CustomerID = c.CustomerID
--) > 5;

-------------------------------------

-- 4. Products that have been ordered at least once ----

--SELECT
--    p.ProductID,
--    p.ProductName
--FROM Products p
--WHERE EXISTS (
--    SELECT 1
--    FROM [Order Details] od
--    WHERE od.ProductID = p.ProductID
--);

-------------------------------------

-- 5. Customers that spent above avg per order ---------

--SELECT
--    CustomerID,
--    CompanyName,
--    AVG(OrderTotal) AS AverageOrderValue
--FROM (
--    SELECT
--        c.CustomerID,
--        c.CompanyName,
--        o.OrderID,
--        SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS OrderTotal
--    FROM Customers c
--    JOIN Orders o
--        ON c.CustomerID = o.CustomerID
--    JOIN [Order Details] od
--        ON o.OrderID = od.OrderID
--    GROUP BY c.CustomerID, c.CompanyName, o.OrderID
--) CustomerOrderTotals
--GROUP BY CustomerID, CompanyName
--HAVING AVG(OrderTotal) > (
--    SELECT AVG(OrderTotal)
--    FROM (
--        SELECT
--            OrderID,
--            SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--        FROM [Order Details]
--        GROUP BY OrderID
--    ) AllOrderTotals
--);

-------------------------------------

-- 6. Products above the avg price for their category --

--SELECT
--    p.ProductID,
--    p.ProductName,
--    p.CategoryID,
--    p.UnitPrice
--FROM Products p
--WHERE p.UnitPrice > (
--    SELECT AVG(p2.UnitPrice)
--    FROM Products p2
--    WHERE p2.CategoryID = p.CategoryID
--);

-------------------------------------


-- Bonus! ---------------------------------------------

-- 7. Find products cheaper than the average price ------

--SELECT
--    ProductID,
--    ProductName,
--    UnitPrice
--FROM Products
--WHERE UnitPrice < (
--    SELECT AVG(UnitPrice)
--    FROM Products
--);

-------------------------------------

-- 8. Find customers who have placed at least one order -

--SELECT
--    c.CustomerID,
--    c.CompanyName
--FROM Customers c
--WHERE EXISTS (
--    SELECT 1
--    FROM Orders o
--    WHERE o.CustomerID = c.CustomerID
--);

-------------------------------------

-- 9. Find orders with total value greater than average -

--SELECT
--    OrderID,
--    OrderTotal
--FROM (
--    SELECT
--        OrderID,
--        SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--    FROM [Order Details]
--    GROUP BY OrderID
--) OrderTotals
--WHERE OrderTotal > (
--    SELECT AVG(OrderTotal)
--    FROM (
--        SELECT
--            OrderID,
--            SUM(UnitPrice * Quantity * (1 - Discount)) AS OrderTotal
--        FROM [Order Details]
--        GROUP BY OrderID
--    ) AllOrderTotals
--);

-------------------------------------

-- 10. Find products never ordered (use subquery, not JOIN)

--SELECT
--    p.ProductID,
--    p.ProductName
--FROM Products p
--WHERE NOT EXISTS (
--    SELECT 1
--    FROM [Order Details] od
--    WHERE od.ProductID = p.ProductID
--);

-------------------------------------

-- 11. Find employees who handled more than 10 orders ---

--SELECT
--    e.EmployeeID,
--    e.FirstName + ' ' + e.LastName AS EmployeeName,
--    (
--        SELECT COUNT(*)
--        FROM Orders o
--        WHERE o.EmployeeID = e.EmployeeID
--    ) AS TotalOrders
--FROM Employees e
--WHERE (
--    SELECT COUNT(*)
--    FROM Orders o
--    WHERE o.EmployeeID = e.EmployeeID
--) > 10;

-------------------------------------

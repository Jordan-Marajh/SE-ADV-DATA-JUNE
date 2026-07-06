USE Northwind;

-- 1. -------------------------------

--SELECT 
--	OrderID,
--	SUM(UnitPrice * Quantity * (1-Discount)) AS Revenue,
--	CASE
--		WHEN SUM(UnitPrice * Quantity * (1-Discount)) < 500 THEN 'Low'
--		WHEN SUM(UnitPrice * Quantity * (1-Discount)) BETWEEN 500 AND 1500 THEN 'Medium'
--		WHEN SUM(UnitPrice * Quantity * (1-Discount)) > 1000 THEN 'High'
--	END AS Category
--FROM [Order Details]
--GROUP BY OrderID;

-------------------------------------

-- 2. -------------------------------

--SELECT 
--	ProductName,
--	UnitsInStock,
--	CASE
--		WHEN UnitsInStock > 100 THEN 'High'
--		WHEN UnitsInStock > 50 THEN 'Medium'
--		WHEN UnitsInStock > 10 THEN 'Low'
--		WHEN UnitsInStock = 0 THEN 'Out of stock!'
--	END AS 'Stock Status'
--FROM Products;

-------------------------------------

-- 3. -------------------------------

--SELECT
--    CASE
--        WHEN UnitPrice < 10 THEN 'Cheap'
--        WHEN UnitPrice BETWEEN 10 AND 20 THEN 'Mid'
--        ELSE 'Expensive'
--    END AS PriceCategory,
--    COUNT(*) AS NumberOfProducts
--FROM Products
--GROUP BY
--    CASE
--        WHEN UnitPrice < 10 THEN 'Cheap'
--        WHEN UnitPrice BETWEEN 10 AND 20 THEN 'Mid'
--        ELSE 'Expensive'
--    END;

--SELECT
--    SUM(CASE WHEN UnitPrice < 10 THEN 1 ELSE 0 END) AS Cheap,
--    SUM(CASE WHEN UnitPrice BETWEEN 10 AND 20 THEN 1 ELSE 0 END) AS Mid,
--    SUM(CASE WHEN UnitPrice > 20 THEN 1 ELSE 0 END) AS Expensive
--FROM Products;

-------------------------------------

-- 4. -------------------------------

--SELECT 
--	CustomerID,
--	COUNT(CustomerID) AS OrderCount,
--	CASE
--		WHEN COUNT(CustomerID) > 10 THEN 'Frequent'
--		ELSE 'Occasional'
--	END AS Frequency
--FROM Orders
--GROUP BY CustomerID;

-------------------------------------

-- 5. -------------------------------

--SELECT 
--	od.ProductID,
--	p.ProductName,
--	SUM(od.Quantity) AS QuantitySold,
--	CASE 
--		WHEN SUM(od.Quantity) < 50 THEN 'Low'
--		WHEN SUM(od.Quantity) BETWEEN 50 AND 200 THEN 'Medium'
--		ELSE 'High'
--	END AS SaleCategory
--FROM [Order Details] od
--JOIN Products p
--	ON od.ProductID = p.ProductID
--GROUP BY od.ProductID, p.ProductName
--ORDER BY od.ProductID;

-------------------------------------

-- 6. -------------------------------

--SELECT TOP 10 * FROM Products;

--SELECT 
--	ProductID,
--	ProductName,
--	UnitPrice,
--	CASE 
--		WHEN UnitPrice > ( SELECT AVG(UnitPrice) FROM Products pInner 
--			WHERE p.CategoryID = pInner.CategoryID 
--		) THEN 'Above Avg'
--		ELSE 'Below Avg'
--	END AS PriceCategory
--FROM Products p
--WHERE UnitPrice > ( 
--	SELECT AVG(UnitPrice) FROM Products pInner 
--	WHERE p.CategoryID = pInner.CategoryID
--);

-------------------------------------
USE Northwind;


-- 1. -------------------------------

--SELECT TOP 10 * FROM Customers;

--SELECT *
--FROM Customers
--WHERE Country = 'Germany';

-------------------------------------

-- 2. -------------------------------

--SELECT TOP 10 * FROM Products;

--SELECT *
--FROM Products
--WHERE UnitPrice > 20;

-------------------------------------

-- 3. -------------------------------

--SELECT TOP 10 * FROM Employees

--SELECT FirstName, LastName, City
--FROM Employees;

-------------------------------------

-- 4. -------------------------------

--SELECT *
--FROM Products
--WHERE UnitsInStock = 0;

-------------------------------------

-- 5. -------------------------------

-- SELECT TOP 10 * FROM Orders

--SELECT *
--FROM Orders
--WHERE ShipCountry = 'France';

-------------------------------------

-- 6. -------------------------------

--SELECT *
--FROM Customers
--WHERE City LIKE 'B%';

-------------------------------------

-- 7. -------------------------------

--SELECT * 
--FROM Products
--WHERE QuantityPerUnit LIKE '%jar%' OR QuantityPerUnit LIKE '%bottle%';

-------------------------------------

-- 8. -------------------------------

--SELECT *
--FROM Employees
--WHERE BirthDate > '1960-12-31';

-------------------------------------

-- 9. -------------------------------

--SELECT * 
--FROM Products
--ORDER BY UnitPrice DESC;

-------------------------------------

-- 10. -------------------------------

--SELECT CompanyName, ContactName
--FROM Customers
--WHERE City IN ('London', 'Madrid');

-------------------------------------
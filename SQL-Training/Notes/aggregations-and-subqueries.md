# Aggregations and subqueries

Here I'll be writing my solutions to problems regarding Northwind DB. They're split into three sections: Aggregations, Subqueries and Bonus problems.

## Aggregations exercises

### 1. Orders per customer

Use the aggregate `COUNT()` to count the number of orders and do this for each customer ID via the `GROUP BY` clause.

```sql
SELECT 
    c.ContactName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c
	ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID,c.ContactName;
```

*Expected output:*

![Problem 1 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-01-output.png)

---

### 2. Total Revenue (whole database)

I only need to use the `[Order Details]` table for this.

```sql
SELECT
    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
FROM [Order Details];
```

*Expected output:*

![Problem 2 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-02-output.png)

---

### 3. Revenue Per Order

Again, I only need to use the `[Order Details]` table for this. This is the same statement as before, except we now can ask to filter by `OrderID`.

```sql
SELECT
    SUM(UnitPrice * Quantity * (1 - Discount)) AS TotalRevenue
FROM [Order Details]
GROUP BY OrderID;
```

*Expected output:*

![Problem 3 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-03-output.png)

---

### 4. Revenue per customer

The revenue calculation is familiar. We only need to use this in conjucation with a few (inner) joins to get customer information linked to the revenue they generate.

```sql
SELECT 
    c.CustomerID,
    c.CompanyName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalRevenue
FROM [Order Details] as od
JOIN Orders o
    ON od.OrderID = o.OrderID
JOIN Customers c
    ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CompanyName;
```

*Expected output:*

![Problem 4 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-04-output.png)

---

### 5. Count total number of products

This is simple as all we need to do is count the number of rows in the Products table. We have also given it an alias for the output table.

```sql
SELECT COUNT(*) AS TotalProducts FROM Products;
```

*Expected output:*

![Problem 5 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-05-output.png)

---

### 6. Find the most expensive product

This problem *is* solvable using an aggregate function, namely `MAX()`. The solution uses `TOP 1 WITH TIES` in case there are multiple most expensive products with the same price.

```sql
SELECT TOP 1 WITH TIES
    ProductID,
    ProductName,
    MAX(UnitPrice) AS MostExpensivePrice
FROM Products
GROUP BY ProductID, ProductName
ORDER BY MAX(UnitPrice) DESC;
```

*Expected output:*

![Problem 6 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-06-output.png)

This is not the most natural solution however. The simplest would be to order the rows of the products table by descending unit price and take the top row with ties. See below.

```sql
SELECT TOP 1 WITH TIES
    ProductID,
    ProductName,
    UnitPrice AS MostExpensivePrice
FROM Products
ORDER BY UnitPrice DESC;
```

---

### 7. Total quantity sold per product

The order details table contains the quantity ordered per product ID. Of course, the product ID may (and does) appear multiple times in the table so I can just sum over the `Quantity` column grouping by product name and ID (there's a `JOIN` so that I can also get the product name).

```sql
SELECT
	p.ProductName,
	od.ProductID,
	SUM(od.Quantity) AS TotalSold
FROM [Order Details] od
JOIN Products p
	ON p.ProductID = od.ProductID
GROUP BY od.ProductID, p.ProductName;
```

*Expected output:*

![Problem 7 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-07-output.png)

---

### 8. Customers who made more than 5 orders

```sql
SELECT 
```

*Expected output:*

![Problem 8 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-08-output.png)

---

### 9. Top 3 orders by total value

```sql

```

*Expected output:*

![Problem 9 output](/Images/SQL-Training-Images/Aggregations-and-subqueries/agg-problem-09-output.png)

## Subqueries exercises



## Bonus!
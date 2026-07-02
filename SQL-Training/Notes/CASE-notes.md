# CASE

The `CASE` expression allows for banching logic like if statements in other languages such as Python. This is typically used for categorisation and is the first instance of me making a decision for SQL rather than the other way around.

## CASE Exercises

### 1. Create a Query that uses CASE to sort Orders into "revenue buckets of "Low", "Medium" and "High"

Here, I just use output the revenue buckets by the logic which is fairly arbitrary. I chose 500 and 1500 as cutoffs.

```sql
SELECT 
	OrderID,
	SUM(UnitPrice * Quantity * (1-Discount)) AS Revenue,
	CASE
		WHEN SUM(UnitPrice * Quantity * (1-Discount)) < 500 THEN 'Low'
		WHEN SUM(UnitPrice * Quantity * (1-Discount)) BETWEEN 500 AND 1500 THEN 'Medium'
		WHEN SUM(UnitPrice * Quantity * (1-Discount)) > 1000 THEN 'High'
	END AS Category
FROM [Order Details]
GROUP BY OrderID;
```

*Expected output:*

![Problem 1 output](/Images/SQL-Training-Images/CASE/problem-01-output.png)

---

### 2. Output ProductName, UnitsInStock and a custom column called "Stock Status" that reflects the level of stock of that item

Same logic as the previous question. Here it is simpler as there is no formula to consider.

```sql
SELECT 
	ProductName,
	UnitsInStock,
	CASE
		WHEN UnitsInStock > 100 THEN 'High'
		WHEN UnitsInStock > 50 THEN 'Medium'
		WHEN UnitsInStock > 10 THEN 'Low'
		WHEN UnitsInStock = 0 THEN 'Out of stock!'
	END AS 'Stock Status'
FROM Products;
```

*Expected output:*

![Problem 2 output](/Images/SQL-Training-Images/CASE/problem-02-output.png)

---

### 3. Product Price Categories (CASE + Aggregation)

*Problem description*
Count how many products fall into each price category:
- Cheap (< 10)
- Mid (10–20)
- Expensive (> 20)

Here I used a CASE statement to define the price categories and used another CASE for ordering.

```sql
SELECT
    CASE
        WHEN UnitPrice < 10 THEN 'Cheap'
        WHEN UnitPrice BETWEEN 10 AND 20 THEN 'Mid'
        ELSE 'Expensive'
    END AS PriceCategory,
    COUNT(*) AS NumberOfProducts
FROM Products
GROUP BY
    CASE
        WHEN UnitPrice < 10 THEN 'Cheap'
        WHEN UnitPrice BETWEEN 10 AND 20 THEN 'Mid'
        ELSE 'Expensive'
    END;
```

*Expected output:*

![Problem 3 output](/Images/SQL-Training-Images/CASE/problem-03-output.png)

I prefer the slightly slicker version with conditional aggregates, but has less pretty output.

```sql
SELECT
    SUM(CASE WHEN UnitPrice < 10 THEN 1 ELSE 0 END) AS Cheap,
    SUM(CASE WHEN UnitPrice BETWEEN 10 AND 20 THEN 1 ELSE 0 END) AS Mid,
    SUM(CASE WHEN UnitPrice > 20 THEN 1 ELSE 0 END) AS Expensive
FROM Products;
```

*Expected output:*

![Problem 3 alt output](/Images/SQL-Training-Images/CASE/alt-problem-03-output.png)

---

### 4. Customer Order Count with Labels (CASE + GROUP BY)

*Problem description*
Show each customer and label them:
- “Frequent” (> 10 orders)
- “Occasional” (≤ 10)

This 

```sql
SELECT 
	CustomerID,
	COUNT(CustomerID) AS OrderCount,
	CASE
		WHEN COUNT(CustomerID) > 10 THEN 'Frequent'
		ELSE 'Occasional'
	END AS Frequency
FROM Orders
GROUP BY CustomerID;
```

*Expected output:*

![Problem 4 output](/Images/SQL-Training-Images/CASE/problem-04-output.png)

---

### 5. Product Sales Buckets (CASE + Aggregation + JOIN)

*Problem description*
For each product, calculate total quantity sold and categorise:
- Low (< 50)
- Medium (50–200)
- High (> 200)

Here I just use the `SUM()` statement to get the total quantity of an item sold which means I group on product name and ID. The `JOIN` is necessary if you want both the product name and ID. If just the ID was necessary, no join would be needed. Of course, the CASE statement is used to categorise as required.

```sql
SELECT 
	od.ProductID,
	p.ProductName,
	SUM(od.Quantity) AS QuantitySold,
	CASE 
		WHEN SUM(od.Quantity) < 50 THEN 'Low'
		WHEN SUM(od.Quantity) BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END AS SaleCategory
FROM [Order Details] od
JOIN Products p
	ON od.ProductID = p.ProductID
GROUP BY od.ProductID, p.ProductName
ORDER BY od.ProductID;
```

*Expected output:*

![Problem 5 output](/Images/SQL-Training-Images/CASE/problem-05-output.png)

---

### 6. Products Above Category Average (Correlated Subquery + CASE)

*Problem description:*
Return products where:
- Price is above the average for their category
- Include a label “Above Avg” / “Below Avg”

Here I used a correlated subquery with CASE, where I wanted to average over CategoryID. There is likely a more efficient solution or one which is slicker/easier to read, but this is the solution I came up with. Notably, removing the `WHERE` clause at the end gives all products with a label of above or below average, and including it solves the problem as requested.

```sql
SELECT 
	ProductID,
	ProductName,
	UnitPrice,
	CASE 
		WHEN UnitPrice > ( SELECT AVG(UnitPrice) FROM Products pInner 
			WHERE p.CategoryID = pInner.CategoryID 
		) THEN 'Above Avg'
		ELSE 'Below Avg'
	END AS PriceCategory
FROM Products p
WHERE UnitPrice > ( 
	SELECT AVG(UnitPrice) FROM Products pInner 
	WHERE p.CategoryID = pInner.CategoryID
);
```

*Expected output:*

![Problem 6 output](/Images/SQL-Training-Images/CASE/problem-06-output.png)

---
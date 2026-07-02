# Basic SQL Queries for reference

Using the Northwind Database we can practise some basic SQL queries before we move on to more advanced techniques.

Since I was unfamiliar with this database, I decided to explore where necessary to solve the problem. A more structured exploration of Northwind DB can be found in the main `README.md` file for this repository.

## Basic SQL Examples

### 1. List all customers from Germany.

Here, I noticed there was a `Customers` table, so I used the following command to see the structure of the table:

```sql
SELECT TOP 10 * FROM Customers;
```

*Expected output:*

![Customers table preview](/Images/SQL-Training-Images/Basic-SQL-Queries/customers-table-preview.png)

Once I took a look at the table, the solution was fairly simple to write.

```sql
SELECT *
FROM Customers
WHERE Country = 'Germany';
```

*Expected output:*

![Problem 1 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-01-output.png)

---

### 2. List all products with a unit price greater than 20.

For this problem, I used the `Products` table. I first checked the structure of the table using:

```sql
SELECT TOP 10 * FROM Products;
```

*Expected output:*

![Products table preview](/Images/SQL-Training-Images/Basic-SQL-Queries/products-table-preview.png)

The relevant column is `UnitPrice`, so I filtered the table to show only products with a unit price greater than 20 using a `WHERE` statement.

```sql
SELECT *
FROM Products
WHERE UnitPrice > 20;
```

*Expected output:*

![Problem 2 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-02-output.png)

---

### 3. Display the first name, last name and city of all employees.

For this problem, the relevant table is `Employees`. I first checked the structure of the table using:

```sql
SELECT TOP 10 * FROM Employees;
```

*Expected output:*

![Employees table preview](/Images/SQL-Training-Images/Basic-SQL-Queries/employees-table-preview.png)

The table contains the columns `FirstName`, `LastName` and `City`, which are exactly the columns needed for this problem.

```sql
SELECT FirstName, LastName, City
FROM Employees;
```

*Expected output:*

![Problem 3 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-03-output.png)

---

### 4. List all products that are out of stock.

This problem uses the `Products` table again. The relevant column is `UnitsInStock`.

```sql
SELECT *
FROM Products
WHERE UnitsInStock = 0;
```

*Expected output:*

![Problem 4 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-04-output.png)

---

### 5. List all orders shipped to France.

Here, I used the `Orders` table. I first checked the structure of the table using:

```sql
SELECT TOP 10 * FROM Orders;
```

*Expected output:*

![Orders table preview](/Images/SQL-Training-Images/Basic-SQL-Queries/orders-table-preview.png)

The relevant column is `ShipCountry`, which tells us where each order was shipped.

```sql
SELECT *
FROM Orders
WHERE ShipCountry = 'France';
```

*Expected output:*

![Problem 5 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-05-output.png)

---

### 6. List all customers whose city begins with B.

This problem uses the `Customers` table. Since I wanted cities beginning with a particular letter, I used `LIKE`.

```sql
SELECT *
FROM Customers
WHERE City LIKE 'B%';
```

*Expected output:*

![Problem 6 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-06-output.png)

Here, `'B%'` means that the city must begin with `B`, followed by any number of characters.

---

### 7. List all products sold in jars or bottles.

This problem uses the `Products` table. The relevant column is `QuantityPerUnit`, since this describes how each product is packaged.

```sql
SELECT * 
FROM Products
WHERE QuantityPerUnit LIKE '%jar%' 
   OR QuantityPerUnit LIKE '%bottle%';
```

*Expected output:*

![Problem 7 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-07-output.png)

Here, `%jar%` means that the word `jar` can appear anywhere in the text. Similarly, `%bottle%` means that the word `bottle` can appear anywhere in the text.

---

### 8. List all employees born after 31 December 1960.

This problem uses the `Employees` table. The relevant column is `BirthDate`.

```sql
SELECT *
FROM Employees
WHERE BirthDate > '1960-12-31';
```

*Expected output:*

![Problem 8 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-08-output.png)

I used the date format `YYYY-MM-DD`, which is a clear format to use in SQL Server.

---

### 9. List all products ordered by unit price from highest to lowest.

This problem uses the `Products` table. Since the question asks for the products to be ordered from highest to lowest unit price, I used `ORDER BY` with `DESC`.

```sql
SELECT * 
FROM Products
ORDER BY UnitPrice DESC;
```

*Expected output:*

![Problem 9 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-09-output.png)

Here, `DESC` means descending order, so the most expensive products appear first.

---

### 10. Display the company name and contact name for customers in London or Madrid.

This problem uses the `Customers` table. I only needed the `CompanyName` and `ContactName` columns.

```sql
SELECT CompanyName, ContactName
FROM Customers
WHERE City IN ('London', 'Madrid');
```

*Expected output:*

![Problem 10 output](/Images/SQL-Training-Images/Basic-SQL-Queries/problem-10-output.png)

The `IN` keyword is useful here because it lets me check whether the city is one of several possible values.
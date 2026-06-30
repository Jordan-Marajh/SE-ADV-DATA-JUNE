# Basic SQL Queries for reference

Using the Northwind Database we can practice some basic SQL queries before we move on to more advanced techniques.

Since I was unfmailiar with this databse, I decided to explore where necessary to solve the problem.

## Basic SQL Examples

1. List all customers from Germany.

Here, I noticed there was a Customers table, so I used the following command to see the structure of the table:

```sql
SELECT TOP 10 * FROM Customers;
```

![customers preview](Images/customers-table-preview.png)

Once I took a look at the table, the solution was fairly simple to write.

```sql
SELECT *
FROM Customers
WHERE Country = 'Germany';
```

2. 
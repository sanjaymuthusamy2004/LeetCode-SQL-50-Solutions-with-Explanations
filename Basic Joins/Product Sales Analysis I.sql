/*
Problem: 1068. Product Sales Analysis I
Link: https://leetcode.com/problems/product-sales-analysis-i/

Description:
- You are given two tables: 'Sales' and 'Product'.

Table: Sales
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
- (sale_id, year) is the primary key.
- product_id is a foreign key referencing Product(product_id).
- price is per unit.

Table: Product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
- product_id is the primary key.
- Each row gives the name of a product.

Task:
- Report product_name, year, and price for each sale in the Sales table.
- The result can be returned in any order.

Constraints:
- Each sale_id in Sales has a matching product_id in Product.
- No duplicate rows after join.

Example:

Input:
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Output:
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+

Explanation:
- sale_id=1 → Nokia, 2008, 5000
- sale_id=2 → Nokia, 2009, 5000
- sale_id=7 → Apple, 2011, 9000

Approach:
- Perform an LEFT JOIN between Sales and Product on product_id.
- Select product_name from Product, and year, price from Sales.
- Return the results in any order.

Solution:
*/

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales AS s
LEFT JOIN Product AS p
ON s.product_id = p.product_id


/*
Problem: 1070. Product Sales Analysis III
Link: https://leetcode.com/problems/product-sales-analysis-iii/

Description:
- We need to find all sales records that occurred in the **first year** each product was sold.
- For each `product_id`, determine the **earliest year** it appears in the Sales table.
- Return all sales for that product in that year.
- The result should include: `product_id`, `first_year`, `quantity`, and `price`.

Input Example:
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Output Example:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+

Approach:
1. For each product, determine the minimum year it was sold using `MIN(year)` grouped by `product_id`.
2. Join or filter the Sales table to return only rows matching each product's earliest year.
3. Select required columns with `year` renamed as `first_year`.

Solution:
*/

SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
    SELECT 
        product_id,
        MIN(year)
    FROM Sales
    GROUP BY product_id
);

/*
Problem: 1251. Average Selling Price
Link: https://leetcode.com/problems/average-selling-price/

Description:
- We have two tables: `Prices` and `UnitsSold`.
- For each product_id:
  1. Find all units sold that fall within the date range of that product’s price (between start_date and end_date).
  2. Calculate the average selling price = 
        total (price * units) / total units.
- Return product_id and average_price (rounded to 2 decimal places).

Input:
Prices table:
+------------+----------+------------+------------+--------+
| product_id | start_dt | end_dt     | price      |
+------------+----------+------------+------------+--------+
| 1          | 2019-02-17 | 2019-02-28 | 5         |
| 1          | 2019-03-01 | 2019-03-22 | 20        |
| 2          | 2019-02-01 | 2019-02-20 | 15        |
| 2          | 2019-02-21 | 2019-03-31 | 30        |
+------------+----------+------------+------------+--------+

UnitsSold table:
+------------+-------------+-------+
| product_id | purchase_dt | units |
+------------+-------------+-------+
| 1          | 2019-02-25  | 100   |
| 1          | 2019-03-01  | 15    |
| 2          | 2019-02-10  | 200   |
| 2          | 2019-03-22  | 30    |
+------------+-------------+-------+

Output:
+------------+---------------+
| product_id | average_price |
+------------+---------------+
| 1          | 6.96          |
| 2          | 16.96         |
+------------+---------------+

Approach:
1. LEFT Join `Prices` and `UnitsSold` on product_id.
2. Add condition: purchase_dt between start_dt and end_dt.
3. Calculate weighted average:
       SUM(price * units) / SUM(units).
4. Round result to 2 decimal places.

Solution:
*/

SELECT
    P.product_id,
    IFNULL( ROUND( SUM(P.price * U.units) / SUM(U.units) , 2 ) , 0 ) AS average_price
FROM Prices AS P

LEFT JOIN UnitsSold  AS U
    ON P.product_id = U.product_id
    AND purchase_date BETWEEN start_date AND end_date   

GROUP BY product_id

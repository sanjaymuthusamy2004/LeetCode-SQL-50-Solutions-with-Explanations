/*
## 1327. List the Products Ordered in a Period
Link : https://leetcode.com/problems/list-the-products-ordered-in-a-period/description/

### Table Schema

#### Products
| Column Name      | Type    |
| ---------------- | ------- |
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |

- `product_id` is the primary key (unique).
- This table contains data about the company's products.

#### Orders
| Column Name   | Type |
| ------------- | ---- |
| product_id    | int  |
| order_date    | date |
| unit          | int  |

- May contain duplicates.
- `product_id` is a foreign key referencing `Products.product_id`.
- `unit` = number of products ordered in `order_date`.

---

### Problem Statement
Find the names of products that have at least **100 units ordered in February 2020**, along with their total units.  

Return the result table in any order.

---

### Example
**Input:**

Products table:
+-------------+-----------------------+------------------+
| product_id  | product_name          | product_category |
+-------------+-----------------------+------------------+
| 1           | Leetcode Solutions    | Book             |
| 2           | Jewels of Stringology | Book             |
| 3           | HP                    | Laptop           |
| 4           | Lenovo                | Laptop           |
| 5           | Leetcode Kit          | T-shirt          |
+-------------+-----------------------+------------------+

Orders table:
+--------------+--------------+----------+
| product_id   | order_date   | unit     |
+--------------+--------------+----------+
| 1            | 2020-02-05   | 60       |
| 1            | 2020-02-10   | 70       |
| 2            | 2020-01-18   | 30       |
| 2            | 2020-02-11   | 80       |
| 3            | 2020-02-17   | 2        |
| 3            | 2020-02-24   | 3        |
| 4            | 2020-03-01   | 20       |
| 4            | 2020-03-04   | 30       |
| 4            | 2020-03-04   | 60       |
| 5            | 2020-02-25   | 50       |
| 5            | 2020-02-27   | 50       |
| 5            | 2020-03-01   | 50       |
+--------------+--------------+----------+

**Output:**
+--------------------+---------+
| product_name       | unit    |
+--------------------+---------+
| Leetcode Solutions | 130     |
| Leetcode Kit       | 100     |
+--------------------+---------+

---

### Approach
1. **Join** `Products` with `Orders` on `product_id`.  
2. **Filter** rows where the year is `2020` and the month is `02`.  
3. **Group by** `product_id` to sum up total units.  
4. Use `HAVING` to select only products with total units ≥ 100.  

---

*/


SELECT
    p.product_name ,
    SUM(o.unit) AS unit 
FROM Products AS p

JOIN Orders AS o 
USING (product_id)

WHERE YEAR(o.order_date) = '2020' AND MONTH(o.order_date) = '02'

GROUP BY p.product_id
HAVING SUM(o.unit) >= 100;

/*
## 1484. Group Sold Products By The Date
Link : https://leetcode.com/problems/group-sold-products-by-the-date/description/

### Table Schema

| Column Name | Type    |
| ----------- | ------- |
| sell_date   | date    |
| product     | varchar |

- There is no primary key (duplicates are possible).
- Each row contains the product name and the date it was sold.

---

### Problem Statement
Write a solution to find for each date:  
1. The number of different products sold.  
2. The list of product names sold, sorted lexicographically and separated by commas.  

Return the result table ordered by `sell_date`.

---

### Example
Input:
Activities table:
+------------+------------+
| sell_date  | product    |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+

Output:
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+

---

### Approach
1. Use `COUNT(DISTINCT product)` to count the number of unique products sold on each date.  
2. Use `GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',')` to join product names in sorted order.  
3. Group results by `sell_date` to aggregate per date.  
4. Order the final result by `sell_date`.  

---

*/


SELECT 

    sell_date,
    COUNT( DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC separator ',') AS products

FROM Activities 

GROUP BY sell_date

ORDER BY sell_date

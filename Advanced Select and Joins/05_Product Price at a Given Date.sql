/*
# 1164. Product Price at a Given Date
Link : https://leetcode.com/problems/product-price-at-a-given-date/description/
---

## Table Schema

**Products**

| Column Name | Type |
|-------------|------|
| product_id  | int  |
| new_price   | int  |
| change_date | date |

- `(product_id, change_date)` is the primary key.  
- Each row indicates that the price of some product changed to a new price on that date.  
- Initially, all products have price = **10**.  

---

## Problem Statement
Find the prices of all products on the date **2019-08-16**.  

Return the result table in any order.  

---

## Example

**Input:**

Products table:

| product_id | new_price | change_date |
|------------|-----------|-------------|
| 1          | 20        | 2019-08-14  |
| 2          | 50        | 2019-08-14  |
| 1          | 30        | 2019-08-15  |
| 1          | 35        | 2019-08-16  |
| 2          | 65        | 2019-08-17  |
| 3          | 20        | 2019-08-18  |

**Output:**

| product_id | price |
|------------|-------|
| 2          | 50    |
| 1          | 35    |
| 3          | 10    |

**Explanation:**  
- On 2019-08-16, product 1’s latest price is 35.  
- Product 2’s latest price before or on 2019-08-16 is 50.  
- Product 3 has no change yet, so it remains at initial price 10.  

---

## Approach
1. For each product, find the **latest change_date ≤ '2019-08-16'**.  
2. Use that change record’s price as the current price.  
3. If a product has no price change before 2019-08-16, assign the initial price (10).  
4. Combine both results with `UNION`.  

---

## SQL Solution

*/

SELECT 
    product_id, 
    new_price AS price
FROM Products
WHERE (product_id, change_date) IN 
(
    SELECT
        product_id,
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT
    product_id,
    10 AS price
FROM Products
WHERE product_id NOT IN 
(
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);

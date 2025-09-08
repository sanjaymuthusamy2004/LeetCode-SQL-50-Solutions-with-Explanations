/*
## Problem: 1321. Restaurant Growth  
Link : https://leetcode.com/problems/restaurant-growth/description/
---

## Table Schema  

### Customer  
+---------------+---------+  
| Column Name   | Type    |  
+---------------+---------+  
| customer_id   | int     |  
| name          | varchar |  
| visited_on    | date    |  
| amount        | int     |  
+---------------+---------+  
- (customer_id, visited_on) is the primary key.  
- `visited_on` = date on which the customer visited.  
- `amount` = total paid by that customer on that day.  

---

## Problem Statement  

You are the restaurant owner analyzing possible expansion.  

- Compute the **7-day moving average** of how much customers paid (current day + 6 days before).  
- Return:  
  - `visited_on`  
  - `amount` (total paid in last 7 days)  
  - `average_amount` (rounded to 2 decimal places).  
- Only output rows starting from the **7th day**.  
- Order results by `visited_on` ascending.  

---

## Example  

### Input:  

Customer table:  
+-------------+--------------+--------------+-------------+  
| customer_id | name         | visited_on   | amount      |  
+-------------+--------------+--------------+-------------+  
| 1           | Jhon         | 2019-01-01   | 100         |  
| 2           | Daniel       | 2019-01-02   | 110         |  
| 3           | Jade         | 2019-01-03   | 120         |  
| 4           | Khaled       | 2019-01-04   | 130         |  
| 5           | Winston      | 2019-01-05   | 110         |  
| 6           | Elvis        | 2019-01-06   | 140         |  
| 7           | Anna         | 2019-01-07   | 150         |  
| 8           | Maria        | 2019-01-08   | 80          |  
| 9           | Jaze         | 2019-01-09   | 110         |  
| 1           | Jhon         | 2019-01-10   | 130         |  
| 3           | Jade         | 2019-01-10   | 150         |  
+-------------+--------------+--------------+-------------+  

### Output:  

+--------------+--------------+----------------+  
| visited_on   | amount       | average_amount |  
+--------------+--------------+----------------+  
| 2019-01-07   | 860          | 122.86         |  
| 2019-01-08   | 840          | 120            |  
| 2019-01-09   | 840          | 120            |  
| 2019-01-10   | 1000         | 142.86         |  
+--------------+--------------+----------------+  

---

## Approach  

  1. For each date, look at the payments from that day and the 6 days before (a 7-day window).

  2. Add up all the amount values in this window → this gives the total amount.

  3. Divide the total by 7 to get the average amount (round to 2 decimals).

  4. Only start showing results from the 7th day onwards, since before that we don’t have a full 7-day window.

  5. Finally, sort the results by visited_on (earliest to latest).

---

## SQL Solution  

*/

SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM Customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM Customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM Customer AS c
  
WHERE visited_on >= (
    SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
    FROM Customer
)
  
GROUP BY visited_on
  
ORDER BY visited_on ASC;

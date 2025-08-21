/*
Problem: 1174. Immediate Food Delivery II
Link: https://leetcode.com/problems/immediate-food-delivery-ii/

Description:
- We have a Delivery table with delivery_id, customer_id, order_date, and customer_pref_delivery_date.
- If `customer_pref_delivery_date = order_date` → Immediate order.
- Otherwise → Scheduled order.
- The **first order of a customer** is defined as the order with the earliest order_date for that customer.
- Goal: Find the percentage of **immediate first orders** across all customers (rounded to 2 decimals).

Input:
Delivery table:
+-------------+-------------+------------+-----------------------------+
| delivery_id | customer_id | order_date | customer_pref_delivery_date |
+-------------+-------------+------------+-----------------------------+
| 1           | 1           | 2019-08-01 | 2019-08-02                  |
| 2           | 2           | 2019-08-02 | 2019-08-02                  |
| 3           | 1           | 2019-08-11 | 2019-08-12                  |
| 4           | 3           | 2019-08-24 | 2019-08-24                  |
| 5           | 3           | 2019-08-21 | 2019-08-22                  |
| 6           | 2           | 2019-08-11 | 2019-08-13                  |
| 7           | 4           | 2019-08-09 | 2019-08-09                  |
+-------------+-------------+------------+-----------------------------+

Output:
+----------------------+
| immediate_percentage |
+----------------------+
| 50.00                |
+----------------------+

Explanation:
- Customer 1 → first order = delivery_id 1 → scheduled.
- Customer 2 → first order = delivery_id 2 → immediate.
- Customer 3 → first order = delivery_id 5 → scheduled.
- Customer 4 → first order = delivery_id 7 → immediate.
→ 2 out of 4 customers have immediate first orders = 50.00%.

Approach:
1. Get each customer's first order using MIN(order_date)..
2. Filter Delivery table to only these first orders using a (customer_id, order_date) match.
3. For these first orders, evaluate how many were immediate (order date equals preferred date).
4. Use AVG(...) * 100 to compute the percentage of immediate first deliveries.
5. Round to 2 decimal places.

Solution:
*/

SELECT 
    ROUND(AVG(order_date = customer_pref_delivery_date)*100,2) AS immediate_percentage
FROM Delivery
  
WHERE (customer_id , order_date) in (
    SELECT customer_id, min(order_date)
    FROM delivery
    GROUP BY customer_id
);

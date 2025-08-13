/*
Problem: 1581. Customer Who Visited but Did Not Make Any Transactions
Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

Description:
- You are given two tables: 'Visits' and 'Transactions'.

Table: Visits
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
- visit_id is the primary key.
- Each row contains a record of a customer's visit to the mall.

Table: Transactions
+----------------+---------+--------+
| Column Name    | Type    | 
+----------------+---------+--------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+--------+
- transaction_id is the primary key.
- Each row contains a record of a transaction made during a particular visit.

Task:
- Find the IDs of customers who visited the mall but did not make any transactions.
- Also count how many times each customer made such visits.
- Return the results sorted in any order.

Constraints:
- A visit_id can appear in Transactions table 0 or more times.
- A customer can have multiple visit_ids.

Example:

Input:
Visits:
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+

Transactions:
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+

Output:
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+

Explanation:
- Customer 54 visited three times, but two visits had no transactions.
- Customer 30 visited once without making any transactions.
- Customer 96 visited once without making any transactions.

Approach:
- Use LEFT JOIN to combine Visits with Transactions on visit_id.
- Filter rows where transaction_id IS NULL (no transaction made).
- GROUP BY customer_id to count such visits.

Solution:
*/

SELECT
    customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits AS v
  
LEFT JOIN Transactions AS t
ON v.visit_id = t.visit_id

WHERE t.transaction_id IS NULL
GROUP BY customer_id;


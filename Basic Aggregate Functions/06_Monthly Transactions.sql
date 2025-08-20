/*
Problem: 1193. Monthly Transactions I
Link: https://leetcode.com/problems/monthly-transactions-i/

Description:
- We are given a Transactions table with id, country, state, amount, and trans_date.
- We need to find, for each month and country:
  1. The total number of transactions.
  2. The total amount of transactions.
  3. The number of approved transactions.
  4. The total amount of approved transactions.
- Return results grouped by month and country.

Input:
Transactions table:
+------+---------+----------+--------+------------+
| id   | country | state    | amount | trans_date |
+------+---------+----------+--------+------------+
| 121  | US      | approved | 1000   | 2018-12-18 |
| 122  | US      | declined | 2000   | 2018-12-19 |
| 123  | US      | approved | 2000   | 2019-01-01 |
| 124  | DE      | approved | 2000   | 2019-01-07 |
+------+---------+----------+--------+------------+

Output:
+----------+---------+-------------+----------------+--------------------+-----------------------+
| month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
+----------+---------+-------------+----------------+--------------------+-----------------------+
| 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
| 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
| 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
+----------+---------+-------------+----------------+--------------------+-----------------------+

Explanation:
- For `2018-12 US`: 
    Transactions = 2, Approved = 1, Total amount = 3000, Approved amount = 1000.
- For `2019-01 US`: 
    Transactions = 1, Approved = 1, Total amount = 2000, Approved amount = 2000.
- For `2019-01 DE`: 
    Transactions = 1, Approved = 1, Total amount = 2000, Approved amount = 2000.

Approach:
1. Extract year-month from `trans_date` using `DATE_FORMAT(trans_date, '%Y-%m')`.
2. Group by `month` and `country`.
3. Use `COUNT(*)` for total transactions.
4. Use `SUM(state = 'approved')` for approved count.
5. Use `SUM(amount)` for total transaction amount.
6. Use conditional sum (`IF(state='approved', amount, 0)`) for approved total amount.

Solution:
*/

SELECT
    DATE_FORMAT(trans_date , '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(state = 'approved') AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY 
    month,
    country;

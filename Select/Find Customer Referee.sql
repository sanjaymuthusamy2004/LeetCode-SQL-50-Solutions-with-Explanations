/*
Problem: 584. Find Customer Referee
Link: https://leetcode.com/problems/find-customer-referee/

Description:
- You are given a table 'Customer' with the following structure:
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | id          | int     |
    | name        | varchar |
    | referee_id  | int     |
    +-------------+---------+
    id is the primary key column for this table.
- The table contains information about customers and the ID of their referee.
- You need to find the names of customers whose referee_id is NOT 2 (including customers with NULL referee_id).

Constraints:
- The referee_id column can be NULL.
- Return results in any order.

Example:

Input:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | NULL       |
| 2  | Jane | NULL       |
| 3  | Alex | 2          |
| 4  | Bill | NULL       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Output:
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

Approach:
- Select 'name' from the 'Customer' table.
- Use a WHERE clause to filter:
  1. referee_id is not equal to 2.
  2. OR referee_id is NULL (since NULL != 2 will not return TRUE in SQL).
- This ensures we get customers without a referee or whose referee is not ID 2.

Solution:
*/

SELECT
    name
FROM Customer
WHERE referee_id is NULL  OR
      referee_id != 2

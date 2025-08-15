/*
Problem: 570. Managers with at Least 5 Direct Reports
Link: https://leetcode.com/problems/managers-with-at-least-5-direct-reports/

Description:
- Given an Employee table with each employee's id, name, department, and managerId,
  find all managers who have at least 5 direct reports.
- A direct report is an employee whose `managerId` matches the manager's `id`.
- The result should list only the names of such managers.

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+

Approach:
1. Self-join the Employee table:
   - e1 = potential manager
   - e2 = direct report
   - Join condition: e1.id = e2.managerId
2. Group by e1.id, e1.name (i.e., the manager's ID and name).
3. Filter to only managers with 5 or more direct reports.
4. Select only the manager’s name.

Solution:
*/

SELECT
    e1.name
FROM Employee AS e1

INNER JOIN Employee AS e2
ON e1.id = e2.managerId

GROUP BY e2.managerId
HAVING COUNT(e2.managerId) >= 5


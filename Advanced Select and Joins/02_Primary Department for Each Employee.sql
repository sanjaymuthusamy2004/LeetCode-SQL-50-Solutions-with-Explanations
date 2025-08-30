/*
Problem: 1789. Primary Department for Each Employee
Link: https://leetcode.com/problems/primary-department-for-each-employee/

Description:
- Each employee may belong to multiple departments, but must have exactly one primary department.
- If an employee has multiple departments, the one with `primary_flag = 'Y'` is their primary.
- If an employee belongs to only one department, then that department is considered primary even if `primary_flag = 'N'`.
- Task: Report each employee's primary department.

Input: Employee table:
+-------------+---------------+--------------+
| employee_id | department_id | primary_flag |
+-------------+---------------+--------------+
| 1           | 1             | N            |
| 2           | 1             | Y            |
| 2           | 2             | N            |
| 3           | 3             | N            |
| 4           | 2             | N            |
| 4           | 3             | Y            |
| 4           | 4             | N            |
+-------------+---------------+--------------+

Output:
+-------------+---------------+
| employee_id | department_id |
+-------------+---------------+
| 1           | 1             |
| 2           | 1             |
| 3           | 3             |
| 4           | 3             |
+-------------+---------------+

Explanation:
- Employee 1 has only one department (1), so it is primary by default.
- Employee 2 has two departments, primary is 1 (flagged 'Y').
- Employee 3 has only one department (3).
- Employee 4 has three departments, primary is 3 (flagged 'Y').

Approach:
1. Select all departments where `primary_flag = 'Y'` → primary department for multi-department employees.
2. Union with employees who have only one department → `HAVING COUNT(*) = 1`.
3. Return results as employee_id and department_id.

Solution:
*/

SELECT
     employee_id,
     department_id 
FROM Employee
WHERE 
    primary_flag = 'Y' 

UNION

SELECT
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id 
HAVING COUNT(employee_id) = 1

ORDER BY employee_id ASC;

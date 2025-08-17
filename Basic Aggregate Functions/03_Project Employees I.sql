/*
Problem: 1075. Project Employees I
Link: https://leetcode.com/problems/project-employees-i/

Description:
- We have two tables: `Project` and `Employee`.
- Each project has multiple employees assigned.
- We need to calculate the average years of experience of employees working on each project.
- Round the result to 2 decimal places.

Input:
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+

Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+

Output:
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+

Explanation:
- Project 1 has employees {1,2,3} → average = (3+2+1)/3 = 2.00
- Project 2 has employees {1,4}   → average = (3+2)/2 = 2.50

Approach:
1. Join `Project` with `Employee` on employee_id.
2. Group by project_id.
3. Compute average of `experience_years` and round to 2 decimals.

Solution:
*/

SELECT
    project_id,
    ROUND( AVG(e.experience_years), 2) AS average_years 
FROM Project AS p

LEFT JOIN Employee AS e
ON p.employee_id = e.employee_id

GROUP BY project_id;

/*
Problem: 577. Employee Bonus
Link: https://leetcode.com/problems/employee-bonus/

Description:
- Given `Employee` and `Bonus` tables, find all employees whose bonus is less than 1000.
- If an employee has no bonus record, treat it as NULL.
- Return their name and bonus amount.

Tables:
Employee(empId, name, supervisor, salary)
Bonus(empId, bonus)

Example:
Input:
Employee:
+-------+--------+------------+--------+
| empId | name   | supervisor | salary |
+-------+--------+------------+--------+
| 3     | Brad   | null       | 4000   |
| 1     | John   | 3          | 1000   |
| 2     | Dan    | 3          | 2000   |
| 4     | Thomas | 3          | 4000   |
+-------+--------+------------+--------+
Bonus:
+-------+-------+
| empId | bonus |
+-------+-------+
| 2     | 500   |
| 4     | 2000  |
+-------+-------+

Output:
+------+-------+
| name | bonus |
+------+-------+
| Brad | null  |
| John | null  |
| Dan  | 500   |
+------+-------+

Approach:
- Perform a LEFT JOIN from Employee to Bonus so all employees appear, even if no bonus record exists.
- Filter using: bonus < 1000 OR bonus IS NULL.
- Return the name and bonus.

Solution:
*/

SELECT 
    e.name,
    b.bonus
FROM Employee as e

LEFT JOIN Bonus as b
ON e.empId = b.empId

WHERE b.bonus < 1000 OR 
      b.bonus IS NULL;

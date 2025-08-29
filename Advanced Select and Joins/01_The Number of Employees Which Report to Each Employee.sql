/*
## 1731. The Number of Employees Which Report to Each Employee
Link : https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/description/
  
### Problem Description
We need to report the  id and name of each manager , the number of employees who report directly to them, and the  average age of those employees (rounded to the nearest integer) .  
A  manager  is defined as an employee with at least one direct report.  

Return the result table  ordered by employee_id .

---

### Table: Employees

| Column Name  | Type    |
|--------------|---------|
| employee_id  | int     |
| name         | varchar |
| reports_to   | int     |
| age          | int     |

- `employee_id` is the primary key.  
- `reports_to` indicates the `employee_id` of the manager. If null, the employee has no manager.  

---

### Example 1

 Input: Employees table 

| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |

 Output: 

| employee_id | name  | reports_count | average_age |
|-------------|-------|---------------|-------------|
| 9           | Hercy | 2             | 39          |

---

### Example 2

 Input: Employees table 

| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 1           | Michael | null       | 45  |
| 2           | Alice   | 1          | 38  |
| 3           | Bob     | 1          | 42  |
| 4           | Charlie | 2          | 34  |
| 5           | David   | 2          | 40  |
| 6           | Eve     | 3          | 37  |
| 7           | Frank   | null       | 50  |
| 8           | Grace   | null       | 48  |

 Output: 

| employee_id | name    | reports_count | average_age |
|-------------|---------|---------------|-------------|
| 1           | Michael | 2             | 40          |
| 2           | Alice   | 2             | 37          |
| 3           | Bob     | 1             | 37          |

---

Approach : 
  - CROSS-join the Employees table to pair each manager (e1) with their direct reports (e2) using e1.employee_id = e2.reports_to.
  - Group by the manager's employee_id to aggregate report data.
  - Count the number of direct reports and compute the average age (rounded) from the report side (e2).
  - Select the manager's ID and name, along with the calculated values, and sort by employee_id.
### SQL Solution

```sql

  */

SELECT 
    e1.employee_id,
    e1.name,
    COUNT(e2.reports_to) AS reports_count ,
    ROUND(AVG(e2.age))AS average_age

FROM Employees AS e1
CROSS JOIN Employees AS e2

WHERE e1.employee_id = e2.reports_to

GROUP BY e1.employee_id

ORDER BY e1.employee_id


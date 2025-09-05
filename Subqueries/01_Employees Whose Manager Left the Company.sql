/*
# 1978. Employees Whose Manager Left the Company
Link : https://leetcode.com/problems/employees-whose-manager-left-the-company/description/
---

## Table Schema

Employees

| Column Name | Type    |
|-------------|---------|
| employee_id | int     |
| name        | varchar |
| manager_id  | int     |
| salary      | int     |

- `employee_id` is the primary key.  
- `manager_id` is either another employee’s ID or `NULL`.  
- Some employees do not have a manager (`manager_id IS NULL`).  

---

## Problem Statement
Find all employees who satisfy both conditions:  
1. Their salary is strictly less than $30,000.  
2. Their manager has left the company (i.e., `manager_id` does not exist in the Employees table).  

Return the results ordered by employee_id.  

---

## Example

Input:

Employees table:

| employee_id | name      | manager_id | salary |
|-------------|-----------|------------|--------|
| 3           | Mila      | 9          | 60301  |
| 12          | Antonella | null       | 31000  |
| 13          | Emery     | null       | 67084  |
| 1           | Kalel     | 11         | 21241  |
| 9           | Mikaela   | null       | 50937  |
| 11          | Joziah    | 6          | 28485  |

Output:

| employee_id |
|-------------|
| 11          |

Explanation:  
- Employees with salary `< 30000` → IDs `1 (Kalel)` and `11 (Joziah)`.  
- `Kalel`’s manager is `11`, who still exists in the company → ❌ not included.  
- `Joziah`’s manager is `6`, who left (no record in table) → ✅ included.  

---

## Approach
1. First filter employees with salary < 30000.  
2. Check if their `manager_id` does not exist in the Employees table.  
3. Return the valid employees sorted by `employee_id`.  

---

## SQL Solution

*/

SELECT
    employee_id
FROM Employees

WHERE salary < 30000
AND manager_id  NOT IN (SELECT employee_id from Employees)

ORDER BY employee_id

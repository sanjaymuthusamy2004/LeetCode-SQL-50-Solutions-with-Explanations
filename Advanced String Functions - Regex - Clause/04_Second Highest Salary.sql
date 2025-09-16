/*
## 176. Second Highest Salary
Link : https://leetcode.com/problems/second-highest-salary/description/

### Table Schema

| Column Name | Type |
| ----------- | ---- |
| id          | int  |
| salary      | int  |

- `id` is the primary key (unique).
- Each row contains the salary of an employee.

---

### Problem Statement
Write a solution to find the **second highest distinct salary** from the `Employee` table.  
If there is no second highest salary, return `null`.  

---

### Example
**Input 1:**
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+

**Output 1:**
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

---

**Input 2:**
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+

Output 2:
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+

---

### Approach
1. Use `DISTINCT` to ensure salaries are unique.  
2. Sort salaries in **descending order**.  
3. Use `LIMIT 1 OFFSET 1` to fetch the **second highest** salary.  
4. Wrap the query in a subquery to return `null` if a second highest does not exist.  

---
*/


SELECT(
    
    SELECT DISTINCT
        salary 
    FROM Employee

    ORDER BY salary DESC
    LIMIT 1 OFFSET 1

) AS SecondHighestSalary;

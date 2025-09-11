/*
## 185. Department Top Three Salaries
Link : https://leetcode.com/problems/department-top-three-salaries/description/
  
### Table Schema
  
**Employee**
  
| Column Name  | Type    |
| ------------ | ------- |
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
  
- `id` is the primary key.  
- `departmentId` is a foreign key referencing `Department.id`.  
- Contains employee details (id, name, salary, departmentId).  

**Department**

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| name        | varchar |

- `id` is the primary key.  
- Contains department information.  

---

### Problem Statement
Find the **high earners** in each department.  
A high earner is an employee whose salary is in the **top three unique salaries** of their department.  

Return each department’s name, employee’s name, and their salary.  
Order of rows does not matter.  

---

### Example
**Input:**

### Employee
  
| id | name  | salary | departmentId |
| -- | ----- | ------ | ------------ |
| 1  | Joe   | 85000  | 1            |
| 2  | Henry | 80000  | 2            |
| 3  | Sam   | 60000  | 2            |
| 4  | Max   | 90000  | 1            |
| 5  | Janet | 69000  | 1            |
| 6  | Randy | 85000  | 1            |
| 7  | Will  | 70000  | 1            |

Department:
  
| id | name  |
|----|-------|
| 1  | IT    |
| 2  | Sales |


**Output:**
| Department | Employee | Salary |
| ---------- | -------- | ------ |
| IT         | Max      | 90000  |
| IT         | Joe      | 85000  |
| IT         | Randy    | 85000  |
| IT         | Will     | 70000  |
| Sales      | Henry    | 80000  |
| Sales      | Sam      | 60000  |


**Explanation:**
- In **IT**:  
  - Max has the 1st highest salary (90000).  
  - Joe & Randy share the 2nd highest (85000).  
  - Will has the 3rd highest (70000).  
- In **Sales**:  
  - Henry has the 1st highest (80000).  
  - Sam has the 2nd highest (60000).  

---

### Approach
1. Join **Employee** and **Department** to link employee details with their department.  
2. For each employee, count how many **unique salaries** in their department are higher.  
3. Keep only those employees where the number of higher salaries is less than 3 (meaning they’re in the top three).  
4. Return department name, employee name, and salary.  

---

### SQL Query
*/
  

SELECT
   D.name AS Department,
   E.name AS Employee,
   E.salary AS Salary
FROM Employee  AS E

JOIN Department AS D
ON E.departmentId = D.id

WHERE 3 > (
    SELECT 
        COUNT(DISTINCT(EM.salary))
    FROM Employee AS EM
    WHERE 
        EM.salary > E.salary
        AND E.DepartmentId = EM.DepartmentId
)



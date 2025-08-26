/*
### 596. Classes With at Least 5 Students
Link: https://leetcode.com/problems/classes-with-at-least-5-students/description/

Problem Description:   
Write a solution to find all the classes that have at least five students.  
Each row in the `Courses` table indicates the name of a student and the class they are enrolled in.  
Return the result table in any order.

---

 Table Schema:   
`Courses`  
- `student` (varchar)  
- `class` (varchar)  
Primary Key: (student, class)

---

 Example Input:   

| student | class    |
|---------|----------|
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |

 Example Output:   

| class   |
|---------|
| Math    |

 Explanation:   
- Math has 6 students, so we include it.  
- English, Biology, and Computer have less than 5 students, so we exclude them.

Approach :
  - Group rows by class, count students in each class using COUNT(*).
  - Filter groups where the count is at least 5 using HAVING COUNT >= 5.
  - Return only the class names as required.

---
 Solution (MySQL): 
```sql

*/
SELECT
    class
FROM Courses
GROUP BY 
    class
HAVING 
    COUNT(class) >= 5 

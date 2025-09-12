/*
## 1667. Fix Names in a Table
Link : https://leetcode.com/problems/fix-names-in-a-table/description/

### Table Schema
 
| Column Name | Type    |
| ----------- | ------- |
| user_id    | int     |
| name        | varchar |

- `user_id` is the primary key (unique).
- `name` consists of only lowercase and uppercase characters.

---

### Problem Statement
Write a solution to fix the names so that only the **first character** is uppercase and the rest are lowercase.  

Return the result table ordered by `user_id`.

---

### Example
**Input:**
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+


**Output:**

+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

### Approach
1. Use `SUBSTRING(name,1,1)` to extract the first character of the name and convert it to uppercase with `UPPER()`.  
2. Use `SUBSTRING(name,2)` to extract the remaining part of the name and convert it to lowercase with `LOWER()`.  
3. Combine both parts using `CONCAT()` to form the corrected name.  
4. Finally, order the results by `user_id`.  

---

*/ 
SELECT
    user_id,
    CONCAT(UPPER(SUBSTRING(name,1,1)), LOWER(SUBSTRING(name,2))) AS name
FROM Users
ORDER BY user_id;

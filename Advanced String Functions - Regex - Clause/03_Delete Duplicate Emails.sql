/*
## 196. Delete Duplicate Emails
Link : https://leetcode.com/problems/delete-duplicate-emails/description/

### Table Schema

| Column Name | Type    |
| ----------- | ------- |
| id          | int     |
| email       | varchar |

- `id` is the primary key (unique).
- Each row of this table contains an email (lowercase only).

---

### Problem Statement
Write a solution to delete all **duplicate emails**, keeping only one record with the **smallest id**.  

The output after deletion will be the updated `Person` table containing only unique emails.  
The final order of rows does not matter.  

---

### Example
**Input:**
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+

**Output:**
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |

**Explanation:**  
- `john@example.com` appears twice (id = 1, 3).  
- Keep the row with the smallest id (1) and delete the other.  
- `bob@example.com` is unique, so it remains.  

---

### Approach
1. Use a **self-join** on the `Person` table: compare each row `p1` with another row `p2`.  
2. Match rows where `p1.email = p2.email`.  
3. Delete rows from `p1` when `p1.id > p2.id` (i.e., keep the smallest id).  
4. This ensures only one unique email remains in the table.  

---
*/

DELETE p1
FROM Person AS p1
  
JOIN Person AS p2
  
WHERE 
  p1.email = p2.email
  AND p1.id > p2.id;

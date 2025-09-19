/*
## 1517. Find Users With Valid E-Mails
Link : https://leetcode.com/problems/find-users-with-valid-e-mails/description/

### Table Schema

#### Users
| Column Name | Type    |
| ----------- | ------- |
| user_id     | int     |
| name        | varchar |
| mail        | varchar |

- `user_id` is the primary key (unique).
- This table contains user information, including their email addresses.

---

### Problem Statement
Find all users who have valid emails.  

A valid email must satisfy:
1. The prefix (before `@`) must start with a letter.  
2. The prefix may contain letters, digits, underscores `_`, periods `.`, or dashes `-`.  
3. The domain must be exactly `@leetcode.com`.  

Return the result table in any order.

---

### Example
Input:

Users table:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |
+---------+-----------+-------------------------+

Output:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+

---

### Approach
1. Use a regular expression to validate emails.  
2. Regex breakdown:  
   - `^[A-Za-z]` → prefix must start with a letter.  
   - `[A-Za-z0-9._-]*` → rest of prefix can have allowed characters.  
   - `@leetcode\.com$` → domain must be exactly `@leetcode.com`.  
3. Apply this regex with `REGEXP_LIKE()` in SQL.  

---

*/

SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$','c');

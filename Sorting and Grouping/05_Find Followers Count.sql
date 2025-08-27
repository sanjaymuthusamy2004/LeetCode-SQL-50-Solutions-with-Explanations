/*
# Problem: 1729. Find Followers Count
Link : https://leetcode.com/problems/find-followers-count/description/

## Problem Description
Table:  Followers 

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
```
- `(user_id, follower_id)` is the  primary key .
- Each row shows that `follower_id` follows `user_id`.

 Goal:   
Return each `user_id` along with their  number of followers , ordered by `user_id` in ascending order.

---

## Example 1:

 Input: 
```
Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
```

 Output: 
```
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
```

Explanation:  
- Followers of `0` → `{1}`  
- Followers of `1` → `{0}`  
- Followers of `2` → `{0, 1}`  

---

## Approach
- Group the rows by `user_id`.  
- Count the `follower_id` for each `user_id`.  
- Sort the result by `user_id` in ascending order.

---

## SQL Solution
```sql

*/
SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id ASC;


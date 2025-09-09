/*
## 602. Friend Requests II: Who Has the Most Friends
Link : https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
  
### Table Schema
Table: RequestAccepted
| Column Name   | Type |
| ------------- | ---- |
| requester\_id | int  |
| accepter\_id  | int  |
| accept\_date  | date |
(requester_id, accepter_id) is the primary key.

---

### Problem Statement
Find the person who has the most friends and the number of friends.  
A person is considered a friend if they appear as either a `requester_id` or `accepter_id`.  
It is guaranteed that there is only one person with the most friends.

---

### Example
Input:
RequestAccepted table:
+--------------+-------------+-------------+
| requester_id | accepter_id | accept_date |
+--------------+-------------+-------------+
|     1        |     2       | 2016/06/03  |
|     1        |     3       | 2016/06/08  |
|     2        |     3       | 2016/06/08  |
|     3        |     4       | 2016/06/09  |
+--------------+-------------+-------------+

Output:
+----+-----+
| id | num |
+----+-----+
| 3  |  3  |
+----+-----+

Explanation:  
The person with `id = 3` is friends with users `1, 2, and 4`, so they have `3` friends in total, which is the maximum.

---

### Approach
  - A friendship can be formed from both sides → requester and accepter.

  -  Combine both requester_id and accepter_id into a single list of friendships.

  -  Count how many times each id appears → that gives total friends for each person.

  -  Pick the person with the highest count (LIMIT 1 after sorting).

---

### SQL Query
*/
  
SELECT
    id,
    COUNT(id) AS num
FROM 
(
    SELECT accepter_id AS id FROM RequestAccepted
    UNION ALL
    SELECT requester_id AS id FROM RequestAccepted
) AS t
  
GROUP BY id
  
ORDER BY num DESC
  
LIMIT 1;

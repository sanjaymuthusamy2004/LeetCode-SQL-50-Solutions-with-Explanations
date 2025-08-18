/*
Problem: 1633. Percentage of Users Attended a Contest
Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/

Description:
- We have two tables: `Users` and `Register`.
- Each user may register for multiple contests.
- We need to compute the percentage of users who attended each contest:
    percentage = (number of users in contest / total users) * 100
- Round the percentage to 2 decimal places.
- Order results:
    1. By percentage in descending order.
    2. By contest_id ascending in case of a tie.

Input:
Users table:
+---------+-----------+
| user_id | user_name |
+---------+-----------+
| 6       | Alice     |
| 2       | Bob       |
| 7       | Alex      |
+---------+-----------+

Register table:
+------------+---------+
| contest_id | user_id |
+------------+---------+
| 215        | 6       |
| 209        | 2       |
| 208        | 2       |
| 210        | 6       |
| 208        | 6       |
| 209        | 7       |
| 209        | 6       |
| 215        | 7       |
| 208        | 7       |
| 210        | 2       |
| 207        | 2       |
| 210        | 7       |
+------------+---------+

Output:
+------------+------------+
| contest_id | percentage |
+------------+------------+
| 208        | 100.0      |
| 209        | 100.0      |
| 210        | 100.0      |
| 215        | 66.67      |
| 207        | 33.33      |
+------------+------------+

Explanation:
- Contest 208, 209, 210 → all 3 users participated → 100%.
- Contest 215 → 2 of 3 users participated → 66.67%.
- Contest 207 → 1 of 3 users participated → 33.33%.

Approach:
1. Group the contest id and count it.
2. Divide by total number of users from `Users` table.
3. Multiply by 100 and round to 2 decimals.
4. Order by percentage DESC, then contest_id ASC.

Solution:
*/

SELECT
    contest_id,
    ROUND( ( COUNT(contest_id)  / (SELECT COUNT(user_id) FROM Users) )  * 100 , 2) AS percentage
FROM Register AS r

LEFT JOIN Users AS u
ON r.user_id = u.user_id

GROUP BY 
        contest_id

ORDER BY 
        percentage DESC,
        contest_id ASC;

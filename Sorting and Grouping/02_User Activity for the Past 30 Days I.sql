/*
Problem: 1141. User Activity for the Past 30 Days I
Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/

Description:
- Given the `Activity` table containing user activities on a social media website.
- We need to find the number of **distinct active users** for each day in the period of 30 days ending on 2019-07-27 (inclusive).
- A user is considered active on a day if they performed at least one activity that day.
- We only return days where there is at least one active user.

Input Example:
Activity table:
+---------+------------+---------------+---------------+
| user_id | session_id | activity_date | activity_type |
+---------+------------+---------------+---------------+
| 1       | 1          | 2019-07-20    | open_session  |
| 1       | 1          | 2019-07-20    | scroll_down   |
| 1       | 1          | 2019-07-20    | end_session   |
| 2       | 4          | 2019-07-20    | open_session  |
| 2       | 4          | 2019-07-21    | send_message  |
| 2       | 4          | 2019-07-21    | end_session   |
| 3       | 2          | 2019-07-21    | open_session  |
| 3       | 2          | 2019-07-21    | send_message  |
| 3       | 2          | 2019-07-21    | end_session   |
| 4       | 3          | 2019-06-25    | open_session  |
| 4       | 3          | 2019-06-25    | end_session   |
+---------+------------+---------------+---------------+

Output Example:
+------------+--------------+
| day        | active_users |
+------------+--------------+
| 2019-07-20 | 2            |
| 2019-07-21 | 2            |
+------------+--------------+

Approach:
1. Filter records to only include `activity_date` in the range (2019-06-27, 2019-07-27].
2. Group by `activity_date`.
3. Count distinct `user_id` for each date.
4. Return results as day and active_users.

Solution:
*/

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE 
  activity_date > '2019-06-27'
  AND activity_date <= '2019-07-27'
GROUP BY activity_date;

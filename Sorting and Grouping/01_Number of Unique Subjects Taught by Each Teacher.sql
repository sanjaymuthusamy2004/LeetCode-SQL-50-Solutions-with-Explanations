/*
Problem: 2356. Number of Unique Subjects Taught by Each Teacher
Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/

Description:
- Given a table `Teacher` with columns: `teacher_id` , `subject_id` and 'dept_id'.
- Need to count the number of **unique** subjects taught by each teacher.
- Return result as `teacher_id` and the count (alias as `cnt`).

Input Example:
Teacher table:
+------------+------------+---------+
| teacher_id | subject_id | dept_id |
+------------+------------+---------+
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |
+------------+------------+---------+

Output Example:
+-------------+-----+
| teacher_id  | cnt |
+-------------+-----+
| 1           | 2   |
| 2           | 2   |
+-------------+-----+

Approach:
1. Group rows by `teacher_id`.
2. Use `COUNT(DISTINCT subject_id)` to count unique subjects.
3. Return teacher_id and count as cnt.

Solution:
*/

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

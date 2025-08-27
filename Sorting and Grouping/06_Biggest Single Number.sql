/*
Problem: 619. Biggest Single Number
Link: https://leetcode.com/problems/biggest-single-number/

Description:
- Find the largest number that appears only once in the MyNumbers table.
- If no such number exists, return null.

Input:
+----------+
| num      |
+----------+
| 8        |
| 8        |
| 3        |
| 3        |
| 1        |
| 4        |
| 5        |
+----------+

Output:
+----------+
| num      |
+----------+
| 5        |
+----------+

Approach:
1. Group the numbers by num to count their occurrences.
2. Use IF(COUNT(num) = 1, num, NULL) to keep only single numbers and convert others to NULL.
3. Sort in descending order and LIMIT 1 to get the largest single number, or NULL if none exist.

Solution:
*/

SELECT
    IF(COUNT(num) = 1,num,NULL) AS num
FROM MyNumbers

GROUP BY num
ORDER BY num DESC

LIMIT 1;

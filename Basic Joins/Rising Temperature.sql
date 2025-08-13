/*
Problem: 197. Rising Temperature
Link: https://leetcode.com/problems/rising-temperature/

Description:
- You are given the 'Weather' table with id, recordDate, and temperature.
- Find all dates (by their id) where the temperature is higher than the previous day's temperature.

Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
- id is unique.
- No two rows share the same recordDate.

Example:

Input:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+

Output:
+----+
| id |
+----+
| 2  |
| 4  |
+----+

Explanation:
- Jan 2: temp rose from 10 → 25.
- Jan 4: temp rose from 20 → 30.

Approach:
- Use a CROSS JOIN on the Weather table to create all possible yesterday–today row combinations.
- Match rows where the difference in recordDate is exactly 1 day.
- Filter results where today's temperature is greater than yesterday's.

Solution:
*/

SELECT
    today.id
FROM Weather AS yesterday
CROSS JOIN Weather AS today
  
WHERE 
    DATEDIFF(today.recordDate, yesterday.recordDate) = 1
AND today.temperature  > yesterday.temperature;

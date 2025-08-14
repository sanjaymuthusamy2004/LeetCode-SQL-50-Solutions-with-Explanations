/*
Problem: 1661. Average Time of Process per Machine
Link: https://leetcode.com/problems/average-time-of-process-per-machine/

Description:
- You are given a table `Activity` tracking start and end times for processes on machines.
- Each (machine_id, process_id) has exactly one 'start' and one 'end' record.
- The goal is to compute the average processing time per machine, where:
    processing_time = (end_timestamp - start_timestamp) / number_of_processes.
- Round the result to 3 decimal places.

Table: Activity
+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |
+----------------+---------+
- (machine_id, process_id, activity_type) is the primary key.

Example:
Input:
+------------+------------+---------------+-----------+
| machine_id | process_id | activity_type | timestamp |
+------------+------------+---------------+-----------+
| 0          | 0          | start         | 0.712     |
| 0          | 0          | end           | 1.520     |
| 0          | 1          | start         | 3.140     |
| 0          | 1          | end           | 4.120     |
| 1          | 0          | start         | 0.550     |
| 1          | 0          | end           | 1.550     |
| 1          | 1          | start         | 0.430     |
| 1          | 1          | end           | 1.420     |
| 2          | 0          | start         | 4.100     |
| 2          | 0          | end           | 4.512     |
| 2          | 1          | start         | 2.500     |
| 2          | 1          | end           | 5.000     |
+------------+------------+---------------+-----------+

Output:
+------------+-----------------+
| machine_id | processing_time |
+------------+-----------------+
| 0          | 0.894           |
| 1          | 0.995           |
| 2          | 1.456           |
+------------+-----------------+

Approach:
- Self-join `Activity` on (machine_id, process_id) where one row is 'start' and the other is 'end'.
- Subtract start timestamp from end timestamp to get each process's duration.
- Group by machine_id and average the durations.
- Round to 3 decimal places using ROUND().

Solution:
*/

SELECT 
    a1.machine_id,
    ROUND( AVG(a2.timestamp - a1.timestamp),3) AS processing_time
FROM Activity AS a1
JOIN Activity AS a2
ON 
    a1.machine_id = a2.machine_id 
    AND a1.process_id  = a2.process_id 
    AND a1.activity_type = 'start' 
    AND a2.activity_type = 'end'
    
GROUP BY a1.machine_id;

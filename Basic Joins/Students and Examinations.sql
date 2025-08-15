/*
Problem: 1280. Students and Examinations
Link: https://leetcode.com/problems/students-and-examinations/

Description:
- Given `Students`, `Subjects`, and `Examinations` tables, 
  return the number of times each student attended each exam.
- We must return ALL combinations of students × subjects 
  even if the count is zero.
- Order by student_id then subject_name.

Approach:
1. Create all possible student–subject combinations using a CROSS JOIN 
   between Students and Subjects.
2. LEFT JOIN this combination with the Examinations table to get attendance records.
3. Use COUNT(e.subject_name) to count exam attendances, 
   where missing matches (NULL) will count as zero.
4. GROUP BY student_id, student_name, subject_name to get final results.
5. ORDER BY student_id, subject_name as required.

Solution:
*/

SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) AS attended_exams

FROM Students As s
# CROSS JOIN ensures you list every student–subject pair (even zeroes).
CROSS JOIN Subjects AS sub 

# LEFT JOIN ensures pairs with zero exams stay in the result.
LEFT JOIN Examinations e
ON s.student_id = e.student_id
   AND e.subject_name = sub.subject_name

GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name    
        
ORDER BY 
    s.student_id,
    sub.subject_name

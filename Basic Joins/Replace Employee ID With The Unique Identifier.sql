/*
Problem: 1378. Replace Employee ID With The Unique Identifier
Link: https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/

Description:
- You are given two tables: 'Employees' and 'EmployeeUNI'.

Table: Employees
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
- id is the primary key (unique values).
- Each row contains the ID and name of an employee.

Table: EmployeeUNI
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
- (id, unique_id) is the primary key (combination is unique).
- Each row maps an employee's id to a unique identifier.

Task:
- Show the unique_id for each employee.
- If an employee does not have a unique_id, show NULL instead.

Constraints:
  - Return results in any order.

Example:

Input:
Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+

EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+

Output:
+-----------+----------+
| unique_id | name     |
+-----------+----------+
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |
+-----------+----------+

Explanation:
- Alice (id=1) and Bob (id=7) have no unique_id → show NULL.
- Meir (id=11) → unique_id = 2
- Winston (id=90) → unique_id = 3
- Jonathan (id=3) → unique_id = 1

Approach:
- Use LEFT JOIN between Employees and EmployeeUNI on id.
- Select unique_id (from EmployeeUNI) and name (from Employees).
- LEFT JOIN ensures employees without a matching unique_id will have NULL in the result.

Solution:
*/

SELECT
    EU.unique_id,
    E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS EU
ON E.id = EU.id

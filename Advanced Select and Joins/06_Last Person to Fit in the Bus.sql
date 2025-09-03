/*
# 1204. Last Person to Fit in the Bus
Link : https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/
---

## Table Schema

Queue

| Column Name | Type    |
|-------------|---------|
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |

- `person_id` contains unique values.  
- `(person_id, turn)` cover all numbers from 1 to n, where n is the number of rows.  
- `turn` determines the order of boarding (turn=1 → first, turn=n → last).  
- The bus has a weight limit = 1000 kg.  

---

## Problem Statement
Find the person_name of the last person who can board the bus without exceeding the weight limit (1000 kg).  

---

## Example

Input:

Queue table:

| person_id | person_name | weight | turn |
|-----------|-------------|--------|------|
| 5         | Alice       | 250    | 1    |
| 4         | Bob         | 175    | 5    |
| 3         | Alex        | 350    | 2    |
| 6         | John Cena   | 400    | 3    |
| 1         | Winston     | 500    | 6    |
| 2         | Marie       | 200    | 4    |

Output:

| person_name |
|-------------|
| John Cena   |

Explanation:  
Ordered by turn:  

| Turn | ID | Name      | Weight | Total Weight |
|------|----|-----------|--------|--------------|
| 1    | 5  | Alice     | 250    | 250          |
| 2    | 3  | Alex      | 350    | 600          |
| 3    | 6  | John Cena | 400    | 1000 ✅ (last person to board) |
| 4    | 2  | Marie     | 200    | 1200 ❌ (exceeds limit) |
| 5    | 4  | Bob       | 175    | --- |
| 6    | 1  | Winston   | 500    | --- |

---

## Approach
1. For each person, calculate the cumulative weight of all people up to their turn.  
2. Keep only those with total weight ≤ 1000.  
3. Return the person with the maximum total weight (the last one who fits).  

---

## SQL Solution

*/ 
  
SELECT 
    q1.person_name
FROM Queue q1 
  
JOIN Queue q2
ON q1.turn >= q2.turn
  
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
  
ORDER BY SUM(q2.weight) DESC
LIMIT 1;

/*
# 180. Consecutive Numbers
Link : https://leetcode.com/problems/consecutive-numbers/description/
---

## Table Schema

 Table : Logs 

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| num         | varchar |

- `id` is the primary key for this table.  
- `id` is an auto-increment column starting from 1.  

---

## Problem Statement
Find all numbers that appear at least three times consecutively in the `Logs` table.  

Return the result table in any order.

---

## Example

 Input: 

Logs table:

| id | num |
|----|-----|
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |

 Output: 

| ConsecutiveNums |
|-----------------|
| 1               |

 Explanation:   
- The number `1` appears consecutively 3 times at ids 1, 2, and 3.  
- No other number appears 3 times in a row.  

---

## Approach
1. Use  self-joins  on the `Logs` table three times (`l1`, `l2`, `l3`).  
2. Ensure consecutive rows with `l1.id + 1 = l2.id` and `l2.id + 1 = l3.id`.  
3. Check that all three rows have the same `num`.  
4. Select distinct `num` values that satisfy the condition.  

---

## SQL Solution

*/ 

SELECT DISTINCT
    l1.num AS ConsecutiveNums
FROM 
    Logs AS l1, 
    Logs AS l2, 
    Logs AS l3
WHERE 
    l1.id + 1 = l2.id
    AND l2.id + 1 = l3.id
    AND l1.num = l2.num
    AND l2.num = l3.num;

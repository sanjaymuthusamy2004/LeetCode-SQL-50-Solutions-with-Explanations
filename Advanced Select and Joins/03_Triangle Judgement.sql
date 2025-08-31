/*
# 610. Triangle Judgement
Link : https://leetcode.com/problems/triangle-judgement/description/
---

## Table Schema

**Triangle**

| Column Name | Type |
|-------------|------|
| x           | int  |
| y           | int  |
| z           | int  |

- `(x, y, z)` is the primary key column for this table.  
- Each row of this table contains the lengths of three line segments.  

---

## Problem Statement
Report for every three line segments whether they can form a triangle.  
A triangle is valid if **the sum of any two sides is greater than the third side**.  

Return the result table in any order.

---

## Example

**Input:**

Triangle table:

| x  | y  | z  |
|----|----|----|
| 13 | 15 | 30 |
| 10 | 20 | 15 |

**Output:**

| x  | y  | z  | triangle |
|----|----|----|----------|
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |

---

## Approach
1. A triangle is possible if :  
     - `x + y > z`  
     - `x + z > y`  
     - `y + z > x`  
2. Apply these conditions using an **IF() function** in SQL.  
3. Output `"Yes"` if all conditions hold, otherwise `"No"`.  

---

## SQL Solution
*/
  
SELECT
    x,
    y,
    z,
    IF(x + y > z AND x + z > y AND y + z > x, "Yes", "No") AS triangle
FROM Triangle;

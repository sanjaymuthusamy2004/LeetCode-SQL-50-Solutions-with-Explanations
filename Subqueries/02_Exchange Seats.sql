/*
# 626. Exchange Seats
Link : https://leetcode.com/problems/exchange-seats/description/
---

## Table Schema

Seat

| Column Name | Type    |
|-------------|---------|
| id          | int     |
| student     | varchar |

- `id` is the primary key (unique).  
- The IDs start at 1 and increase continuously without gaps.  

---

## Problem Statement
Swap the seat ID of every two consecutive students.  
- If the number of students is even, all students are swapped in pairs.  
- If the number of students is odd, the last student remains in the same seat.  

Return the result ordered by `id` in ascending order.  

---

## Example

Input:

Seat table:

| id | student |
|----|---------|
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |

Output:

| id | student |
|----|---------|
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |

Explanation:  
- `1 ↔ 2` swapped → Doris at seat 1, Abbot at seat 2.  
- `3 ↔ 4` swapped → Green at seat 3, Emerson at seat 4.  
- Seat 5 is odd and left unchanged.  

---

## Approach
1. For each row, check if the ID is odd or even.  
2. If `id` is odd → swap with `id + 1`.  
3. If `id` is even → swap with `id - 1`.  
4. Special case: if odd `id` is the last record, it remains unchanged.  
5. Return rows ordered by new `id`.  

---

## SQL Solution

*/

SELECT
    IF(
        id < (SELECT MAX(id) FROM Seat), IF(id % 2 = 1, id + 1, id - 1),  IF(id % 2 = 1, id, id - 1)
    ) AS id,
    student
FROM Seat
ORDER BY id ASC;

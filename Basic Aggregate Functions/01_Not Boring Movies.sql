/*
Problem: 620. Not Boring Movies
Link: https://leetcode.com/problems/not-boring-movies/

Description:
- We need movies that:
  1. Have an odd-numbered id.
  2. Have a description that is not 'boring'.
- Return them ordered by rating (descending).

Approach:
1. Filter with `WHERE MOD(id,2) != 0` → ensures odd id.
2. Exclude boring movies → `AND description != 'boring'`.
3. Sort results by rating descending.

Solution:
*/

SELECT *
FROM Cinema
WHERE 
    MOD(id,2) != 0
    AND description != 'boring'
ORDER BY 
    rating DESC;

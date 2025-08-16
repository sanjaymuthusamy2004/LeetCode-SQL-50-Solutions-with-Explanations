/*
Problem: 1934. Confirmation Rate
Link: https://leetcode.com/problems/confirmation-rate/

Description:
- We have two tables:
  1. Signups → contains all registered users.
  2. Confirmations → contains all confirmation requests with results ('confirmed' or 'timeout').
- A user’s confirmation rate = (No of 'confirmed') / (total no of requests).
- If a user never made a request, their confirmation rate = 0.
- Round the result to 2 decimal places.

Approach:
1. Start with the Signups table so that we include **all users**, even those with no confirmation requests.
2. LEFT JOIN it with the Confirmations table using `user_id`.
3. Use the `IF()` function inside `AVG()`:
   - `IF(c.action = 'confirmed', 1, 0)` turns each row into a 1 (confirmed) or 0 (not confirmed or timeout).
   - `AVG(...)` then calculates the ratio of confirmed requests to total requests.
4. If the user has no confirmations, `AVG()` will return NULL — and it will show up as NULL in the result.
5. Round the result to 2 decimal places.

Note:
- This approach is elegant and concise because it uses `AVG()` on binary values (1s and 0s) to compute a rate.
- If you want to show `0` instead of `NULL` for users with no requests, wrap the `AVG(...)` in `IFNULL(..., 0)`.

Solution:
*/

SELECT
    s.user_id,
    ROUND( AVG( IF(c.action = 'confirmed', 1, 0) ) , 2) AS confirmation_rate
FROM Signups AS s

LEFT JOIN Confirmations  AS c
ON s.user_id = c.user_id

GROUP BY user_id



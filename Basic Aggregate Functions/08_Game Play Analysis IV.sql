/*
Problem: 550. Game Play Analysis IV
Link: https://leetcode.com/problems/game-play-analysis-iv/

Description:
- We have an Activity table with player_id, device_id, event_date, games_played.
- Each row records the activity of a player for a given date.
- A player's first login date = MIN(event_date) for that player.
- We need to find:
    1. The number of players who logged in  again the day after  their first login date.
    2. Divide that number by the  total number of players .
- Result should be rounded to 2 decimal places.

Input:
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+

Output:
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+

Explanation:
- Player 1: First login 2016-03-01, logged in again on 2016-03-02 → counts.
- Player 2: First login 2017-06-25, no login next day → does not count.
- Player 3: First login 2016-03-02, no login on 2016-03-03 → does not count.
Fraction = 1 / 3 = 0.33.

Approach:
1. Determine each player's first login date using MIN(event_date).
2. Join back with Activity table to check if the player logged in on first_date + 1.
3. Count such players and divide by total number of distinct players.
4. Round result to 2 decimal places.

Solution:
*/

SELECT
    ROUND( COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM Activity),2 ) AS fraction
  
FROM (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
) AS a1
  
JOIN Activity AS a2
ON a1.player_id = a2.player_id
AND DATEDIFF(a2.event_date, a1.first_date) = 1;

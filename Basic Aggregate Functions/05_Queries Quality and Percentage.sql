/*
Problem: 1211. Queries Quality and Percentage
Link: https://leetcode.com/problems/queries-quality-and-percentage/

Description:
- We are given a table `Queries` with query_name, result, position, and rating.
- Definitions:
  1. Query Quality = Average of (rating / position) for each query_name.
  2. Poor Query Percentage = Percentage of queries where rating < 3.
- Both results should be rounded to 2 decimal places.
- Return results grouped by query_name.

Input:
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+

Output:
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+

Explanation:
- For `Dog`:
    Quality = ((5/1) + (5/2) + (1/200)) / 3 = 2.50
    Poor %  = (1 poor query / 3 total) * 100 = 33.33
- For `Cat`:
    Quality = ((2/5) + (3/3) + (4/7)) / 3 ≈ 0.66
    Poor %  = (1 poor query / 3 total) * 100 = 33.33

Approach:
1. Use `AVG(rating / position)` to calculate quality.
2. Use conditional aggregation (`CASE WHEN rating < 3 THEN 1 END`) to count poor queries.
3. Divide poor queries by total queries, multiply by 100.
4. Round both results to 2 decimal places.

Solution:
*/

SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
  
FROM Queries
GROUP BY query_name;

/*
Problem: 595. Big Countries
Link: https://leetcode.com/problems/big-countries/

Description:
- You are given a table 'World' with the following structure:
    +-------------+---------+
    | Column Name | Type    |
    +-------------+---------+
    | name        | varchar |
    | continent   | varchar |
    | area        | int     |
    | population  | int     |
    | gdp         | bigint  |
    +-------------+---------+
    - name is the primary key column.
    - Each row contains information about a country, its continent, area (in km²), population, and GDP.
- A country is considered "big" if:
    1. area >= 3000000, OR
    2. population >= 25000000
- You need to return the name, population, and area of all big countries.

Constraints:
- Return results in any order.
- GDP values are not relevant for this problem.
- The area and population values are positive integers.

Example:

Input:
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+

Output:
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+

Approach:
- This is a filtering problem based on given conditions.
- We need to select columns: name, population, and area from the 'World' table.
- Apply the WHERE condition to check if:
  1. area >= 3000000 OR
  2. population >= 25000000
- Return the filtered results.

Solution:
*/

SELECT
    name,
    population,
    area
FROM World 
WHERE 
    area >= 3000000 OR
    population >= 25000000 ;

/*
## Problem: 1341. Movie Rating  
Link : https://leetcode.com/problems/movie-rating/description/
---

## Table Schema  

### Movies  
+---------------+---------+  
| Column Name   | Type    |  
+---------------+---------+  
| movie_id      | int     |  
| title         | varchar |  
+---------------+---------+  
(movie_id is the primary key.)  

### Users  
+---------------+---------+  
| Column Name   | Type    |  
+---------------+---------+  
| user_id       | int     |  
| name          | varchar |  
+---------------+---------+  
(user_id is the primary key, and `name` has unique values.)  

### MovieRating  
+---------------+---------+  
| Column Name   | Type    |  
+---------------+---------+  
| movie_id      | int     |  
| user_id       | int     |  
| rating        | int     |  
| created_at    | date    |  
+---------------+---------+  
(movie_id, user_id) is the primary key for this table.  

---

## Problem Statement  

1. Find the **name of the user** who has rated the **greatest number of movies**.  
   - If there is a tie, return the **lexicographically smaller name**.  

2. Find the **movie name with the highest average rating in February 2020**.  
   - If there is a tie, return the **lexicographically smaller title**.  

Return the result as a single-column table `results`.  

---

## Example  

### Input:  

Movies table:  
+-------------+--------------+  
| movie_id    | title        |  
+-------------+--------------+  
| 1           | Avengers     |  
| 2           | Frozen 2     |  
| 3           | Joker        |  
+-------------+--------------+  

Users table:  
+-------------+--------------+  
| user_id     | name         |  
+-------------+--------------+  
| 1           | Daniel       |  
| 2           | Monica       |  
| 3           | Maria        |  
| 4           | James        |  
+-------------+--------------+  

MovieRating table:  
+-------------+--------------+--------------+-------------+  
| movie_id    | user_id      | rating       | created_at  |  
+-------------+--------------+--------------+-------------+  
| 1           | 1            | 3            | 2020-01-12  |  
| 1           | 2            | 4            | 2020-02-11  |  
| 1           | 3            | 2            | 2020-02-12  |  
| 1           | 4            | 1            | 2020-01-01  |  
| 2           | 1            | 5            | 2020-02-17  |  
| 2           | 2            | 2            | 2020-02-01  |  
| 2           | 3            | 2            | 2020-03-01  |  
| 3           | 1            | 3            | 2020-02-22  |  
| 3           | 2            | 4            | 2020-02-25  |  
+-------------+--------------+--------------+-------------+  

### Output:  

+--------------+  
| results      |  
+--------------+  
| Daniel       |  
| Frozen 2     |  
+--------------+  

---

## SQL Solution  

*/
# Write your MySQL query statement below
(
SELECT
    name as results
FROM MovieRating AS MR

JOIN Users AS U
ON MR.user_id = U.user_id

GROUP BY 
        MR.user_id
ORDER BY 
        COUNT(MR.user_id) DESC ,
        name ASC
LIMIT 1 

)  

UNION ALL

(

SELECT 
    title 
FROM MovieRating AS MR

JOIN Movies AS M
ON MR.movie_id = M.movie_id

WHERE created_at BETWEEN '2020-02-01' AND '2020-02-29'

GROUP BY 
        MR.movie_id

ORDER BY 
        AVG(rating) DESC,
        title ASC
LIMIT 1
)



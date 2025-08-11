/*
Problem: 1148. Article Views I
Link: https://leetcode.com/problems/article-views-i/

Description:
- You are given a table 'Views' with the following structure:
    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | article_id    | int     |
    | author_id     | int     |
    | viewer_id     | int     |
    | view_date     | date    |
    +---------------+---------+
- The table may contain duplicate rows.
- Each row represents that a viewer viewed an article written by an author on a certain date.
- If author_id = viewer_id, it means the author viewed their own article.
- You need to find all authors who have viewed at least one of their own articles.

Constraints:
- No primary key; duplicates may exist.
- Return results sorted by 'id' in ascending order.
- Output should only include distinct author IDs.

Example:

Input:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+

Output:
+------+
| id   |
+------+
| 4    |
| 7    |
+------+

Approach:
- We need authors where author_id = viewer_id.
- Use DISTINCT to ensure we return each author only once.
- Alias the result column as 'id' as per problem requirement.
- Sort results in ascending order.

Solution:
*/

SELECT  DISTINCT
    author_id AS id
FROM Views
WHERE author_id  = viewer_id
ORDER BY author_id ASC;

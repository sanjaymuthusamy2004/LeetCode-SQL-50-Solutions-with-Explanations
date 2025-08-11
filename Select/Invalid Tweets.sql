/*
Problem: 1683. Invalid Tweets
Link: https://leetcode.com/problems/invalid-tweets/

Description:
- You are given a table 'Tweets' with the following structure:
    +----------------+---------+
    | Column Name    | Type    |
    +----------------+---------+
    | tweet_id       | int     |
    | content        | varchar |
    +----------------+---------+
    - tweet_id is the primary key column.
    - content consists of alphanumeric characters, '!', and spaces (' '), with no other special characters.
- A tweet is considered INVALID if the length of its content is strictly greater than 15 characters.
- You need to return the IDs of all invalid tweets.

Constraints:
- The length check is based on the number of characters in the content string.
- Return the result table in any order.

Example:

Input:
+----------+-----------------------------------+
| tweet_id | content                           |
+----------+-----------------------------------+
| 1        | Let us Code                       |
| 2        | More than fifteen chars are here! |
+----------+-----------------------------------+

Output:
+----------+
| tweet_id |
+----------+
| 2        |
+----------+

Explanation:
- Tweet 1: Length = 11 → Valid
- Tweet 2: Length = 33 → Invalid

Approach:
- Use the LENGTH() function (or CHAR_LENGTH(), depending on SQL dialect) to get the number of characters in the 'content'.
- Filter tweets where length > 15.
- Select only the tweet_id of such tweets.

Solution:
*/

SELECT
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15

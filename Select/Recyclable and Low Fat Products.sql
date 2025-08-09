/*
Problem: Recyclable and Low Fat Products
Link: https://leetcode.com/problems/recyclable-and-low-fat-products/

Description:
Find all products that are both recyclable and low fat from the Products table.

Approach:
Filter products where 'recyclable' = 'Y' and 'low_fats' = 'Y'.

Solution:
*/

SELECT 
    product_id
FROM products
WHERE low_fats = 'Y' AND
      recyclable = 'Y' ;


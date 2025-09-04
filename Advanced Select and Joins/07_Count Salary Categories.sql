/*
# 1907. Count Salary Categories
Link : https://leetcode.com/problems/count-salary-categories/description/
---

## Table Schema

Accounts

| Column Name | Type |
|-------------|------|
| account_id  | int  |
| income      | int  |

- `account_id` is the primary key.  
- Each row stores the monthly income of one account.  

---

## Problem Statement
We need to count the number of accounts in each salary category:

- Low Salary → `income < 20000`  
- Average Salary → `20000 <= income <= 50000`  
- High Salary → `income > 50000`  

The output must always include all three categories, even if the count is zero.  

---

## Example

Input:

Accounts table:

| account_id | income |
|------------|--------|
| 3          | 108939 |
| 2          | 12747  |
| 8          | 87709  |
| 6          | 91796  |

Output:

| category       | accounts_count |
|----------------|----------------|
| Low Salary     | 1              |
| Average Salary | 0              |
| High Salary    | 3              |

Explanation:  
- Low Salary → Account `2`.  
- Average Salary → No accounts.  
- High Salary → Accounts `3, 6, 8`.  

---

## Approach
1. Use conditional counting with `IF()` inside `COUNT()`.  
2. Create three separate SELECTs for each category.  
3. Combine results using UNION ALL (to keep all rows, even if count = 0).  

---

## SQL Solution

*/
  
SELECT 
    'Low Salary' AS category,
    COUNT(IF(income < 20000, 1, NULL)) AS accounts_count
FROM Accounts

UNION ALL

SELECT
    'Average Salary' AS category,
    COUNT(IF(income BETWEEN 20000 AND 50000, 1, NULL))
FROM Accounts

UNION ALL

SELECT
    'High Salary' AS category,
    COUNT(IF(income > 50000, 1, NULL))
FROM Accounts;

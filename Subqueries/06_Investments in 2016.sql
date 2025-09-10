/*
## 585. Investments in 2016
Link : https://leetcode.com/problems/investments-in-2016/description/

### Table Schema
Table: Insurance
| Column Name | Type  |
| ----------- | ----- |
| pid         | int   |
| tiv\_2015   | float |
| tiv\_2016   | float |
| lat         | float |
| lon         | float |

- `pid` is the primary key.  
- `tiv_2015`: total investment value in 2015.  
- `tiv_2016`: total investment value in 2016.  
- `lat`, `lon`: represent the policyholder’s city (non-null).  

---

### Problem Statement
Report the **sum of `tiv_2016`** for all policyholders who:
1. Have the same `tiv_2015` value as one or more other policyholders.  
2. Are not located in the same city as any other policyholder (`(lat, lon)` must be unique).  

The result should be **rounded to two decimal places**.

---

### Example
**Input:**
Insurance table:
+-----+----------+----------+-----+-----+
| pid | tiv_2015 | tiv_2016 | lat | lon |
+-----+----------+----------+-----+-----+
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+

**Output:**
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+

**Explanation:**  
- Policyholders with `pid = 1` and `pid = 4` qualify:  
  - They share the same `tiv_2015` value with others.  
  - Their `(lat, lon)` locations are unique.  
- Policyholders `pid = 2` and `pid = 3` do not meet both conditions.  
- So, the sum = `5 + 40 = 45.00`.

---

### Approach
- Use a subquery to **exclude locations (lat, lon) that are duplicated**.  
- Use another subquery to **select tiv_2015 values that appear more than once**.  
- Add only those `tiv_2016` values that satisfy both conditions.  
- Round the final result to **two decimal places**.

---

### SQL Query
*/

SELECT
    ROUND(SUM(tiv_2016),2) AS tiv_2016 
FROM Insurance AS I1
  
WHERE 
    (lat,lon) NOT IN (SELECT lat,lon FROM Insurance  AS I2 WHERE I1.pid != I2.pid )
    AND tiv_2015 IN (SELECT tiv_2015 FROM Insurance AS I3 WHERE I1.pid != I3.pid)

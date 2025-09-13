/*
### Problem: 1527. Patients With a Condition
Link : https://leetcode.com/problems/patients-with-a-condition/description/
  
**Table: Patients**

| Column Name  | Type    |
|--------------|---------|
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |

- `patient_id` is the primary key.  
- `conditions` contains 0 or more codes separated by spaces.  
- Type I Diabetes conditions always start with the prefix **`DIAB1`**.  

---

### Approach
1. Use the `LIKE` operator to search for conditions starting with `"DIAB1"`.  
   - Case 1: `conditions LIKE 'DIAB1%'` → when `DIAB1` is at the beginning.  
   - Case 2: `conditions LIKE '% DIAB1%'` → when `DIAB1` appears after a space in the middle.  
2. Select only the patients that satisfy these conditions.  
3. Return `patient_id`, `patient_name`, and `conditions`.  

---

### SQL Solution
*/
  
SELECT
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%' 
      OR conditions LIKE '% DIAB1%';

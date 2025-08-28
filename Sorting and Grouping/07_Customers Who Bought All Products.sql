/*
## 1045. Customers Who Bought All Products
problem Link : https://leetcode.com/problems/customers-who-bought-all-products/description/
  
### Problem Description
Write a SQL query to report the customer IDs of customers who bought  all the products available  in the Product table.

Return the result table  sorted by customer_id .

---

### Table: Customer

| Column Name  | Type    |
|--------------|---------|
| customer_id  | int     |
| product_key  | int     |

(customer_id, product_key) is the primary key of this table.  
Each row shows that the customer bought the product with product_key.

---

### Table: Product

| Column Name  | Type    |
|--------------|---------|
| product_key  | int     |

product_key is the primary key of this table.

---

### Example Input

 Customer table: 

| customer_id | product_key |
|-------------|-------------|
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |

 Product table: 

| product_key |
|-------------|
| 5           |
| 6           |

### Example Output

| customer_id |
|-------------|
| 1           |
| 3           |

---
  ### Approach
 - Select the customer_id from the Customer table.
 - Group the results by customer_id.
 - Apply a HAVING clause to filter out customers who have not bought all the products.
 - In the HAVING clause, use COUNT(DISTINCT product_key) to count the number of distinct product keys for each customer.
 - Compare this count with the total count of product keys in the Product table obtained through a subquery.
 - If the counts match, it means the customer has bought all the products.
  
### SQL Solution

```sql
*/
  
SELECT
    customer_id 
FROM Customer  

GROUP BY 
    customer_id
HAVING 
    COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product);

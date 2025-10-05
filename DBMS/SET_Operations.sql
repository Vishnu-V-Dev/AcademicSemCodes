-- 1. Create two sample tables for demonstrating set operations
CREATE TABLE employees_2023 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE employees_2024 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- 2. Insert sample data into employees_2023 table
INSERT INTO employees_2023 (name, department) VALUES
('John Doe', 'Sales'),
('Alice Johnson', 'HR'),
('Robert Brown', 'IT'),
('Michael White', 'Finance');

-- 3. Insert sample data into employees_2024 table
INSERT INTO employees_2024 (name, department) VALUES
('John Doe', 'Sales'),
('Jane Smith', 'Marketing'),
('Robert Brown', 'IT'),
('Emily Clark', 'HR');

---

-- **Before performing any operations**: Show the content of both tables

-- Show the contents of employees_2023
SELECT * FROM employees_2023;
Output:
+--------+----------------+------------+
| emp_id | name           | department |
+--------+----------------+------------+
| 1      | John Doe       | Sales      |
| 2      | Alice Johnson  | HR         |
| 3      | Robert Brown   | IT         |
| 4      | Michael White  | Finance    |
+--------+----------------+------------+

-- Show the contents of employees_2024
SELECT * FROM employees_2024;
Output:
+--------+----------------+------------+
| emp_id | name           | department |
+--------+----------------+------------+
| 1      | John Doe       | Sales      |
| 2      | Jane Smith     | Marketing  |
| 3      | Robert Brown   | IT         |
| 4      | Emily Clark    | HR         |
+--------+----------------+------------+

---

-- 4. **UNION** - Combine results from two SELECT statements, removing duplicates
-- Example: Get all unique employee names from both years
SELECT name FROM employees_2023
UNION
SELECT name FROM employees_2024;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Alice Johnson |
-- | Robert Brown  |
-- | Michael White |
-- | Jane Smith    |
-- | Emily Clark   |
-- +---------------+

---

-- 5. **UNION ALL** - Combine results from two SELECT statements, keeping duplicates
-- Example: Get all employee names, including duplicates
SELECT name FROM employees_2023
UNION ALL
SELECT name FROM employees_2024;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Alice Johnson |
-- | Robert Brown  |
-- | Michael White |
-- | John Doe      |
-- | Jane Smith    |
-- | Robert Brown  |
-- | Emily Clark   |
-- +---------------+

---

-- 6. **INTERSECT** (simulated with INNER JOIN) - Get common results between two SELECT statements
-- Example: Get employees who appear in both 2023 and 2024
SELECT e1.name
FROM employees_2023 e1
INNER JOIN employees_2024 e2 ON e1.name = e2.name;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Robert Brown  |
-- +---------------+

---

-- 7. **EXCEPT** (simulated with NOT EXISTS) - Get results from the first SELECT that do not exist in the second
-- Example: Get employees who are in 2023 but not in 2024
SELECT name
FROM employees_2023 e1
WHERE NOT EXISTS (
    SELECT 1 FROM employees_2024 e2 WHERE e1.name = e2.name
);
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | Alice Johnson |
-- | Michael White |
-- +---------------+

---

-- Clean up: Drop the sample tables after use
DROP TABLE employees_2023;
DROP TABLE employees_2024;


-- 1. Create two sample tables for demonstrating set operations
CREATE TABLE employees_2023 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

CREATE TABLE employees_2024 (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- 2. Insert sample data into employees_2023 table
INSERT INTO employees_2023 (name, department) VALUES
('John Doe', 'Sales'),
('Alice Johnson', 'HR'),
('Robert Brown', 'IT'),
('Michael White', 'Finance');

-- 3. Insert sample data into employees_2024 table
INSERT INTO employees_2024 (name, department) VALUES
('John Doe', 'Sales'),
('Jane Smith', 'Marketing'),
('Robert Brown', 'IT'),
('Emily Clark', 'HR');

-- 4. Show employees_2023 table content
SELECT * FROM employees_2023;
-- Expected Output:
-- +--------+----------------+-------------+
-- | emp_id | name           | department  |
-- +--------+----------------+-------------+
-- | 1      | John Doe       | Sales      |
-- | 2      | Alice Johnson  | HR         |
-- | 3      | Robert Brown   | IT         |
-- | 4      | Michael White  | Finance    |
-- +--------+----------------+-------------+

-- 5. Show employees_2024 table content
SELECT * FROM employees_2024;
-- Expected Output:
-- +--------+----------------+-------------+
-- | emp_id | name           | department  |
-- +--------+----------------+-------------+
-- | 1      | John Doe       | Sales      |
-- | 2      | Jane Smith     | Marketing  |
-- | 3      | Robert Brown   | IT         |
-- | 4      | Emily Clark    | HR         |
-- +--------+----------------+-------------+

---

-- 6. **UNION** - Combine results from two SELECT statements, removing duplicates
-- Example: Get all unique employee names from both years
SELECT name FROM employees_2023
UNION
SELECT name FROM employees_2024;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Alice Johnson |
-- | Robert Brown  |
-- | Michael White |
-- | Jane Smith    |
-- | Emily Clark   |
-- +---------------+

---

-- 7. **UNION ALL** - Combine results from two SELECT statements, keeping duplicates
-- Example: Get all employee names, including duplicates
SELECT name FROM employees_2023
UNION ALL
SELECT name FROM employees_2024;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Alice Johnson |
-- | Robert Brown  |
-- | Michael White |
-- | John Doe      |
-- | Jane Smith    |
-- | Robert Brown  |
-- | Emily Clark   |
-- +---------------+

---

-- 8. **INTERSECT** (simulated with INNER JOIN) - Get common results between two SELECT statements
-- Example: Get employees who appear in both 2023 and 2024
SELECT e1.name
FROM employees_2023 e1
INNER JOIN employees_2024 e2 ON e1.name = e2.name;
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | John Doe      |
-- | Robert Brown  |
-- +---------------+

---

-- 9. **EXCEPT** (simulated with NOT EXISTS) - Get results from the first SELECT that do not exist in the second
-- Example: Get employees who are in 2023 but not in 2024
SELECT name
FROM employees_2023 e1
WHERE NOT EXISTS (
    SELECT 1 FROM employees_2024 e2 WHERE e1.name = e2.name
);
-- Expected Output:
-- +---------------+
-- | name          |
-- +---------------+
-- | Alice Johnson |
-- | Michael White |
-- +---------------+

---

-- 10. Clean up: Drop the sample tables after use
DROP TABLE employees_2023;
DROP TABLE employees_2024;

---

### **Challenging Questions & Answers:**

-- 1. **Question:**  
You have two tables, `employees_2023` and `employees_2024`. Suppose that `employees_2024` table has a `salary` column, and `employees_2023` does not. Can you use `UNION` to combine the results of both tables based on the employee's name and their department, even though the tables have different structures? How would you handle this situation?

**Answer:**
Yes, you can still use `UNION` to combine the results, but you would need to align the structure of both queries. Since `employees_2023` does not have a `salary` column, you can use `NULL` for the missing column in the query for `employees_2023`:

```sql
SELECT name, department, NULL AS salary
FROM employees_2023
UNION
SELECT name, department, salary
FROM employees_2024;

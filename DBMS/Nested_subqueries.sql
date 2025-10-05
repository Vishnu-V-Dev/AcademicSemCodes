REATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2)
);

-- =====================================================
-- 🔹 Step 2: Insert Data
-- =====================================================
INSERT INTO department VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Chennai'),
(4, 'Marketing', 'Delhi');

INSERT INTO employee VALUES
(101, 'Alice', 2, 60000),
(102, 'Bob', 2, 55000),
(103, 'Charlie', 3, 70000),
(104, 'David', 1, 40000),
(105, 'Eve', NULL, 50000);

-- =====================================================
-- 🔹 INNER JOIN Example
-- Show employees with their department names
-- =====================================================
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employee e
INNER JOIN department d ON e.dept_id = d.dept_id;

-- ✅ Output:
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|-----------|-----------|----------|
-- | 101    | Alice     | IT        | 60000.00 |
-- | 102    | Bob       | IT        | 55000.00 |
-- | 103    | Charlie   | Finance   | 70000.00 |
-- | 104    | David     | HR        | 40000.00 |


-- =====================================================
-- 🔹 LEFT JOIN Example
-- Show all employees with department names (include employees with no dept)
-- =====================================================
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id;

-- ✅ Output:
-- Includes Eve (dept_id = NULL)
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|-----------|-----------|----------|
-- | 101    | Alice     | IT        | 60000.00 |
-- | 102    | Bob       | IT        | 55000.00 |
-- | 103    | Charlie   | Finance   | 70000.00 |
-- | 104    | David     | HR        | 40000.00 |
-- | 105    | Eve       | NULL      | 50000.00 |


-- =====================================================
-- 🔹 RIGHT JOIN Example
-- Show all departments even if they have no employees
-- =====================================================
SELECT e.emp_name, d.dept_name, d.location
FROM employee e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- ✅ Output:
-- Includes Marketing (no employees)
-- | emp_name | dept_name | location  |
-- |-----------|-----------|-----------|
-- | David     | HR        | Mumbai    |
-- | Alice     | IT        | Bangalore |
-- | Bob       | IT        | Bangalore |
-- | Charlie   | Finance   | Chennai   |
-- | NULL      | Marketing | Delhi     |


-- =====================================================
-- 🔹 NATURAL JOIN Example
-- Join employee and department automatically on common column name (dept_id)
-- =====================================================
SELECT emp_id, emp_name, dept_name, salary
FROM employee
NATURAL JOIN department;

-- ✅ Output:
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|-----------|-----------|----------|
-- | 101    | Alice     | IT        | 60000.00 |
-- | 102    | Bob       | IT        | 55000.00 |
-- | 103    | Charlie   | Finance   | 70000.00 |
-- | 104    | David     | HR        | 40000.00 |

-- NOTE:
-- NATURAL JOIN automatically joins on same column names (dept_id)
-- Avoid using NATURAL JOIN when columns share the same name accidentally.


-- =====================================================
-- 🔹 BONUS: FULL OUTER JOIN (simulated using UNION)
-- =====================================================
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employee e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- =====================================================
-- 🔹 Step 1: Create Sample Tables
-- =====================================================
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    age INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    budget DECIMAL(10,2)
);

-- =====================================================
-- 🔹 Step 2: Insert Sample Data
-- =====================================================
INSERT INTO department VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Bangalore'),
(3, 'Finance', 'Chennai');

INSERT INTO employee VALUES
(101, 'Alice', 2, 60000, 28),
(102, 'Bob', 2, 55000, 25),
(103, 'Charlie', 3, 70000, 30),
(104, 'David', 1, 40000, 26),
(105, 'Eve', 3, 72000, 32),
(106, 'Frank', 1, 38000, 24);

INSERT INTO project VALUES
(1, 'Website Redesign', 2, 200000),
(2, 'Recruitment Portal', 1, 120000),
(3, 'Audit System', 3, 150000);

-- =====================================================
-- 🔹 Problem 1: Single-row Subquery
-- Find employees whose salary is greater than Alice’s salary
-- =====================================================
SELECT emp_name, salary
FROM employee
WHERE salary > (SELECT salary FROM employee WHERE emp_name = 'Alice');

-- ✅ Expected Output:
-- | emp_name | salary  |
-- |-----------|---------|
-- | Charlie   | 70000.00 |
-- | Eve       | 72000.00 |


-- =====================================================
-- 🔹 Problem 2: Multi-row Subquery with IN
-- List employees who work in the same department as 'Alice' or 'David'
-- =====================================================
SELECT emp_name, dept_id
FROM employee
WHERE dept_id IN (
    SELECT dept_id FROM employee WHERE emp_name IN ('Alice', 'David')
);

-- ✅ Expected Output:
-- Employees from IT (2) and HR (1)


-- =====================================================
-- 🔹 Problem 3: Nested Subquery in FROM Clause
-- Show department names and average salary of employees in each department
-- =====================================================
SELECT d.dept_name, avg_data.avg_salary
FROM department d
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY dept_id
) AS avg_data
ON d.dept_id = avg_data.dept_id;

-- ✅ Output:
-- | dept_name | avg_salary |
-- |------------|------------|
-- | HR         | 39000.00   |
-- | IT         | 57500.00   |
-- | Finance    | 71000.00   |


-- =====================================================
-- 🔹 Problem 4: Correlated Subquery
-- Find employees who earn more than the average salary in their department
-- =====================================================
SELECT emp_name, dept_id, salary
FROM employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);

-- ✅ Output:
-- | Charlie | 3 | 70000.00 |
-- | Eve     | 3 | 72000.00 |
-- | Alice   | 2 | 60000.00 |


-- =====================================================
-- 🔹 Problem 5: Nested Subquery with ANY
-- Find employees whose salary is greater than ANY employee in the HR department
-- =====================================================
SELECT emp_name, salary
FROM employee
WHERE salary > ANY (
    SELECT salary FROM employee WHERE dept_id = 1
);

-- ✅ Output:
-- Everyone with salary > 40000 or 38000


-- =====================================================
-- 🔹 Problem 6: Nested Subquery with ALL
-- Find employees whose salary is greater than ALL employees in HR department
-- =====================================================
SELECT emp_name, salary
FROM employee
WHERE salary > ALL (
    SELECT salary FROM employee WHERE dept_id = 1
);

-- ✅ Output:
-- | Alice   | 60000.00 |
-- | Bob     | 55000.00 |
-- | Charlie | 70000.00 |
-- | Eve     | 72000.00 |


-- =====================================================
-- 🔹 Problem 7: Subquery Returning Multiple Columns
-- Find departments where total salary of employees exceeds 100000
-- =====================================================
SELECT dept_id, SUM(salary) AS total_salary
FROM employee
GROUP BY dept_id
HAVING SUM(salary) > 100000;

-- ✅ Output:
-- | dept_id | total_salary |
-- |----------|--------------|
-- | 2        | 115000.00    |
-- | 3        | 142000.00    |


-- =====================================================
-- 🔹 Problem 8: Nested Subquery with EXISTS
-- Find departments that have at least one employee earning more than 60000
-- =====================================================
SELECT dept_name
FROM department d
WHERE EXISTS (
    SELECT 1 FROM employee e
    WHERE e.dept_id = d.dept_id AND e.salary > 60000
);

-- ✅ Output:
-- | dept_name |
-- |------------|
-- | Finance    |
-- | IT         |


-- =====================================================
-- 🔹 Problem 9: Multi-level Nested Subquery
-- Find employee(s) working in the department with the highest budget
-- =====================================================
SELECT emp_name, dept_id
FROM employee
WHERE dept_id = (
    SELECT dept_id
    FROM project
    WHERE budget = (
        SELECT MAX(budget) FROM project
    )
);

-- ✅ Output:
-- | emp_name | dept_id |
-- |-----------|---------|
-- | Alice     | 2 |
-- | Bob       | 2 |


-- =====================================================
-- 🔹 Problem 10: Compare Employee Salary with Department Average
-- Find employees whose salary is below the department average
-- =====================================================
SELECT emp_name, dept_id, salary
FROM employee e
WHERE salary < (
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);

-- ✅ Output:
-- | David | 1 | 40000.00 |
-- | Frank | 1 | 38000.00 |
-- | Bob   | 2 | 55000.00 |


-- =====================================================
-- ✅ End of Nested Subqueries Practical
-- =====================================================

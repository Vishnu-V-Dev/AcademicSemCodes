-- =====================================================
-- Step 1: Create Tables
-- =====================================================
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary DECIMAL(10,2),
    age INT
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    dept_id INT,
    budget DECIMAL(10,2)
);

-- =====================================================
-- Step 2: Insert Data
-- =====================================================
INSERT INTO department VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

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
(3, 'Audit System', 3, 150000),
(4, 'Marketing Campaign', 4, 100000);

-- =====================================================
-- Step 3: Show Full Tables
-- =====================================================
SELECT * FROM department;

-- Output:
-- | dept_id | dept_name  |
-- |---------|------------|
-- | 1       | HR         |
-- | 2       | IT         |
-- | 3       | Finance    |
-- | 4       | Marketing  |

SELECT * FROM employee;

-- Output:
-- | emp_id | emp_name | dept_id | salary   | age |
-- |--------|----------|---------|----------|-----|
-- | 101    | Alice    | 2       | 60000.00 | 28  |
-- | 102    | Bob      | 2       | 55000.00 | 25  |
-- | 103    | Charlie  | 3       | 70000.00 | 30  |
-- | 104    | David    | 1       | 40000.00 | 26  |
-- | 105    | Eve      | 3       | 72000.00 | 32  |
-- | 106    | Frank    | 1       | 38000.00 | 24  |

SELECT * FROM project;

-- Output:
-- | project_id | project_name       | dept_id | budget     |
-- |------------|------------------|---------|-----------|
-- | 1          | Website Redesign  | 2       | 200000.00 |
-- | 2          | Recruitment Portal| 1       | 120000.00 |
-- | 3          | Audit System      | 3       | 150000.00 |
-- | 4          | Marketing Campaign| 4       | 100000.00 |

-- =====================================================
-- 1️⃣ Subquery with IN
SELECT emp_name, dept_id
FROM employee
WHERE dept_id IN (
    SELECT dept_id FROM project
);

-- 2️⃣ Subquery with NOT IN
SELECT emp_name, dept_id
FROM employee
WHERE dept_id NOT IN (
    SELECT dept_id FROM project
);

-- 3️⃣ Subquery with Aggregate Function (MAX)
SELECT emp_name, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary) FROM employee
);

-- 4️⃣ Subquery with Aggregate Function (AVG)
SELECT emp_name, dept_id, salary
FROM employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
    WHERE dept_id = e.dept_id
);

-- 5️⃣ Subquery with Multiple Conditions
SELECT emp_name, dept_id, salary
FROM employee
WHERE dept_id IN (2,3) AND salary > 60000;

-- 6️⃣ Subquery with NOT IN and Age Condition
SELECT emp_name, dept_id, salary
FROM employee
WHERE dept_id NOT IN (
    SELECT dept_id FROM project WHERE budget > 150000
);

-- =====================================================
-- ✅ END OF SUBQUERY PRACTICAL
-- =====================================================

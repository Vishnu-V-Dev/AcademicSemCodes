CREATE TABLE department (
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
-- 1️⃣ INNER JOIN Example
-- Employees with department info
-- =====================================================
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employee e
INNER JOIN department d ON e.dept_id = d.dept_id;

-- Output:
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|----------|-----------|---------|
-- | 101    | Alice    | IT        | 60000.00 |
-- | 102    | Bob      | IT        | 55000.00 |
-- | 103    | Charlie  | Finance   | 70000.00 |
-- | 104    | David    | HR        | 40000.00 |

-- =====================================================
-- 2️⃣ LEFT OUTER JOIN Example
-- All employees with department info (NULL if no dept)
-- =====================================================
SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id;

-- Output:
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|----------|-----------|---------|
-- | 101    | Alice    | IT        | 60000.00 |
-- | 102    | Bob      | IT        | 55000.00 |
-- | 103    | Charlie  | Finance   | 70000.00 |
-- | 104    | David    | HR        | 40000.00 |
-- | 105    | Eve      | NULL      | 50000.00 |

-- =====================================================
-- 3️⃣ RIGHT OUTER JOIN Example
-- All departments with employee info (NULL if no employees)
-- =====================================================
SELECT e.emp_name, d.dept_name, d.location
FROM employee e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- Output:
-- | emp_name | dept_name  | location  |
-- |----------|------------|-----------|
-- | David    | HR         | Mumbai    |
-- | Alice    | IT         | Bangalore |
-- | Bob      | IT         | Bangalore |
-- | Charlie  | Finance    | Chennai   |
-- | NULL     | Marketing  | Delhi     |

-- =====================================================
-- 4️⃣ FULL OUTER JOIN Example (simulated with UNION)
-- All employees and all departments combined
-- =====================================================
SELECT e.emp_name, d.dept_name
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employee e
RIGHT JOIN department d ON e.dept_id = d.dept_id;

-- Output:
-- | emp_name | dept_name  |
-- |----------|------------|
-- | David    | HR         |
-- | Alice    | IT         |
-- | Bob      | IT         |
-- | Charlie  | Finance    |
-- | Eve      | NULL       |
-- | NULL     | Marketing  |

-- =====================================================
-- 5️⃣ NATURAL JOIN Example
-- Automatically joins on dept_id
-- =====================================================
SELECT emp_id, emp_name, dept_name, salary
FROM employee
NATURAL JOIN department;

-- Output:
-- | emp_id | emp_name | dept_name | salary  |
-- |--------|----------|-----------|---------|
-- | 101    | Alice    | IT        | 60000.00 |
-- | 102    | Bob      | IT        | 55000.00 |
-- | 103    | Charlie  | Finance   | 70000.00 |
-- | 104    | David    | HR        | 40000.00 |

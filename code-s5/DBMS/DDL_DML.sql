-- 1. Create a new table with multiple columns
CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    stock_quantity INT,
    PRIMARY KEY (product_id)
);

-- 2. Check the structure of the `products` table after creation
DESC products;

-- 3. Insert data into the `products` table
INSERT INTO products (product_name, price, stock_quantity)
VALUES ('Laptop', 899.99, 10), ('Smartphone', 499.99, 50), ('Headphones', 99.99, 200);

-- 4. Select all records from the `products` table
SELECT * FROM products;

-- 5. Select specific columns from the `products` table
SELECT product_name, price FROM products;

-- 6. Update a record in the `products` table (e.g., increase price of "Laptop")
UPDATE products SET price = price + 100 WHERE product_name = 'Laptop';

-- 7. Delete a specific record from the `products` table (e.g., delete "Headphones")
DELETE FROM products WHERE product_name = 'Headphones';

-- 8. Truncate the `products` table (removes all records)
TRUNCATE TABLE products;

-- 9. Drop the `products` table (removes the table structure and data)
DROP TABLE products;

-- 10. Create a new table for orders
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    PRIMARY KEY (order_id)
);

-- 11. Insert records into the `orders` table
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES (1, '2023-10-01', 150.00), (2, '2023-10-02', 75.50);

-- 12. Select all records from the `orders` table
SELECT * FROM orders;

-- 13. Select records with a filter condition (select orders where total_amount > 100)
SELECT * FROM orders WHERE total_amount > 100;

-- 14. Update the `total_amount` for a specific order in the `orders` table
UPDATE orders SET total_amount = 120.00 WHERE order_id = 1;

-- 15. Delete a record from the `orders` table where the order ID is 2
DELETE FROM orders WHERE order_id = 2;

-- 16. Alter the `orders` table to add a new column for shipping address
ALTER TABLE orders ADD COLUMN shipping_address VARCHAR(255);

-- 17. Add a foreign key constraint between `orders` and `customers` (assuming `customers` table exists)
ALTER TABLE orders ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

-- 18. Drop the foreign key constraint from the `orders` table
ALTER TABLE orders DROP FOREIGN KEY fk_customer;

-- 19. Modify the `order_date` column to allow `NULL` values
ALTER TABLE orders MODIFY COLUMN order_date DATE NULL;

-- 20. Rename the `order_date` column to `purchase_date`
ALTER TABLE orders CHANGE order_date purchase_date DATE;

-- 21. Rename the `orders` table to `customer_orders`
RENAME TABLE orders TO customer_orders;

-- 22. Create a table with default values for some columns
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50) DEFAULT 'General',
    hire_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (employee_id)
);

-- 23. Insert a record without specifying the `department` and `hire_date` (they should take default values)
INSERT INTO employees (name) VALUES ('John Doe');

-- 24. Select all employees with the `department` set to 'General'
SELECT * FROM employees WHERE department = 'General';

-- 25. Alter the `employees` table to change the default value for `department` to 'Sales'
ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'Sales';

-- 26. Insert multiple records into `employees` at once
INSERT INTO employees (name, department) VALUES
    ('Jane Smith', 'HR'),
    ('Bob Johnson', 'IT'),
    ('Alice Davis', 'Sales');

-- 27. Update the department of an employee
UPDATE employees SET department = 'Marketing' WHERE employee_id = 2;

-- 28. Delete an employee from the `employees` table
DELETE FROM employees WHERE employee_id = 3;

-- 29. Add an index to the `name` column for faster searches
ALTER TABLE employees ADD INDEX idx_name (name);

-- 30. Drop the index from the `employees` table
ALTER TABLE employees DROP INDEX idx_name;

-- 31. Create a table with `CHECK` constraints for salary range
CREATE TABLE salary (
    employee_id INT,
    amount DECIMAL(10, 2),
    CHECK (amount >= 30000 AND amount <= 150000),
    PRIMARY KEY (employee_id)
);

-- 32. Insert data into the `salary` table
INSERT INTO salary (employee_id, amount) VALUES (1, 50000), (2, 60000);

-- 33. Select records where the salary is within the specified range
SELECT * FROM salary WHERE amount BETWEEN 30000 AND 100000;

-- 34. Create a table with a composite primary key (ID and Name)
CREATE TABLE department_employees (
    dept_id INT,
    emp_name VARCHAR(100),
    PRIMARY KEY (dept_id, emp_name)
);

-- 35. Insert records into the `department_employees` table
INSERT INTO department_employees (dept_id, emp_name) VALUES (1, 'John Doe'), (1, 'Jane Smith');

-- 36. Select records from `department_employees` with a specific `dept_id`
SELECT * FROM department_employees WHERE dept_id = 1;

-- 37. Create a table with unique constraints on the `email` field
CREATE TABLE users (
    user_id INT AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    PRIMARY KEY (user_id)
);

-- 38. Insert unique email records into the `users` table
INSERT INTO users (email, password) VALUES ('user1@example.com', 'password123');

-- 39. Try inserting a duplicate email (this will fail because of the UNIQUE constraint)
INSERT INTO users (email, password) VALUES ('user1@example.com', 'newpassword');

-- 40. Create a table with `AUTO_INCREMENT` for automatically incrementing IDs
CREATE TABLE products_auto (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(100),
    PRIMARY KEY (product_id)
);

-- 41. Insert a new product (auto increments the `product_id`)
INSERT INTO products_auto (product_name) VALUES ('Smartwatch');

-- 42. Select records from the `products_auto` table to see the auto-incremented IDs
SELECT * FROM products_auto;

-- 43. Create a table with `TIMESTAMP` data type
CREATE TABLE logs (
    log_id INT AUTO_INCREMENT,
    message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (log_id)
);

-- 44. Insert a log record into the `logs` table
INSERT INTO logs (message) VALUES ('System started');

-- 45. Select records from `logs` to see timestamps
SELECT * FROM logs;

-- 46. Create a table with the `ENUM` data type for predefined values
CREATE TABLE survey_responses (
    response_id INT AUTO_INCREMENT,
    response VARCHAR(50) CHECK (response IN ('Excellent', 'Good', 'Average', 'Poor')),
    PRIMARY KEY (response_id)
);

-- 47. Insert survey responses into the `survey_responses` table
INSERT INTO survey_responses (response) VALUES ('Excellent'), ('Good');

-- 48. Update a record in `survey_responses` to change the response
UPDATE survey_responses SET response = 'Average' WHERE response = 'Good';

-- 49. Create a table with `DATE` type for storing birth dates
CREATE TABLE birthdays (
    person_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    birth_date DATE,
    PRIMARY KEY (person_id)
);

-- 50. Insert a record into the `birthdays` table
INSERT INTO birthdays (name, birth_date) VALUES ('John Doe', '1990-05-15');


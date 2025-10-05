-- 1️⃣ Create Database (optional)
CREATE DATABASE IF NOT EXISTS CompanyDB;
USE CompanyDB;

-- ==========================================================
-- 🔹 Step 1: Create Sample Table
-- ==========================================================

CREATE TABLE accounts (
    acc_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10, 2)
);

-- Insert initial data
INSERT INTO accounts (name, balance) VALUES
('Alice', 10000.00),
('Bob', 8000.00),
('Charlie', 12000.00);

-- Check initial data
SELECT * FROM accounts;
/*
Expected Output:
+--------+---------+----------+
| acc_id | name    | balance  |
+--------+---------+----------+
| 1      | Alice   | 10000.00 |
| 2      | Bob     | 8000.00  |
| 3      | Charlie | 12000.00 |
+--------+---------+----------+
*/

-- ==========================================================
-- 🔹 Step 2: Start Transaction Example
-- ==========================================================

-- Disable autocommit to control transactions manually
SET autocommit = 0;

-- Start a transaction manually
START TRANSACTION;

-- Alice sends ₹1000 to Bob
UPDATE accounts SET balance = balance - 1000 WHERE name = 'Alice';
UPDATE accounts SET balance = balance + 1000 WHERE name = 'Bob';

-- Check intermediate result
SELECT * FROM accounts;
/*
Expected Output (Before COMMIT):
| Alice   | 9000.00  |
| Bob     | 9000.00  |
| Charlie | 12000.00 |
*/

-- Rollback transaction to cancel it
ROLLBACK;

-- Verify balances are restored
SELECT * FROM accounts;
/*
Expected Output (After ROLLBACK):
| Alice   | 10000.00 |
| Bob     | 8000.00  |
| Charlie | 12000.00 |
*/

-- ==========================================================
-- 🔹 Step 3: COMMIT Example
-- ==========================================================

START TRANSACTION;

-- Transfer ₹500 from Bob to Charlie
UPDATE accounts SET balance = balance - 500 WHERE name = 'Bob';
UPDATE accounts SET balance = balance + 500 WHERE name = 'Charlie';

-- Verify intermediate result
SELECT * FROM accounts;
/*
Before COMMIT:
| Alice   | 10000.00 |
| Bob     | 7500.00  |
| Charlie | 12500.00 |
*/

-- Commit the changes
COMMIT;

-- Check data after commit
SELECT * FROM accounts;
/*
After COMMIT:
| Alice   | 10000.00 |
| Bob     | 7500.00  |
| Charlie | 12500.00 |
*/

-- ==========================================================
-- 🔹 Step 4: SAVEPOINT Example
-- ==========================================================

START TRANSACTION;

-- Step 1: Alice deposits ₹2000
UPDATE accounts SET balance = balance + 2000 WHERE name = 'Alice';
SAVEPOINT after_deposit;

-- Step 2: Bob withdraws ₹1000
UPDATE accounts SET balance = balance - 1000 WHERE name = 'Bob';
SAVEPOINT after_withdraw;

-- Step 3: Charlie donates ₹500
UPDATE accounts SET balance = balance - 500 WHERE name = 'Charlie';
SAVEPOINT after_donation;

-- Check balances now
SELECT * FROM accounts;
/*
Current State (before rollback):
| Alice   | 12000.00 |
| Bob     | 6500.00  |
| Charlie | 12000.00 |
*/

-- Rollback to a savepoint (cancel only donation)
ROLLBACK TO after_withdraw;

-- Check data again
SELECT * FROM accounts;
/*
After ROLLBACK TO after_withdraw:
| Alice   | 12000.00 |
| Bob     | 6500.00  |
| Charlie | 12500.00 |   -- donation reverted
*/

-- Finally commit the transaction
COMMIT;

-- Verify final data
SELECT * FROM accounts;
/*
Final Output:
| Alice   | 12000.00 |
| Bob     | 6500.00  |
| Charlie | 12500.00 |
*/

-- ==========================================================
-- 🔹 Step 5: RELEASE SAVEPOINT (optional)
-- ==========================================================

START TRANSACTION;
SAVEPOINT temp_point;
UPDATE accounts SET balance = balance + 100 WHERE name = 'Bob';
RELEASE SAVEPOINT temp_point;
COMMIT;

-- Verify Bob’s final balance
SELECT * FROM accounts;
/*
| Alice   | 12000.00 |
| Bob     | 6600.00  |
| Charlie | 12500.00 |
*/

-- ==========================================================
-- 🔹 Step 6: Clean-Up (Optional)
-- ==========================================================

-- Enable autocommit again
SET autocommit = 1;

-- Drop the table after demo
DROP TABLE accounts;


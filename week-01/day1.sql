-- Create a table
CREATE TABLE IF NOT EXISTS employees (
    id INTEGER PRIMARY KEY,
    name TEXT,
    department TEXT,
    salary INTEGER
);

-- Insert some data
INSERT INTO employees VALUES (1, 'Alice', 'HR', 60000);
INSERT INTO employees VALUES (2, 'Bob', 'Engineering', 90000);
INSERT INTO employees VALUES (3, 'Carol', 'Engineering', 85000);
INSERT INTO employees VALUES (4, 'David', 'HR', 55000);

-- Run a query
SELECT name, salary
FROM employees
WHERE department = 'Engineering'
ORDER BY salary DESC;̦̦
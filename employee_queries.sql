-- ============================================
-- EMPLOYEE SALARY QUERIES
-- ============================================

CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;

-- Create Employees table
CREATE TABLE IF NOT EXISTS Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Department VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- Insert sample records
INSERT INTO Employees
(Employee_ID, Employee_Name, Department, Salary)
VALUES
(101, 'Amit', 'IT', 85000),
(102, 'Priya', 'HR', 70000),
(103, 'Rahul', 'IT', 95000),
(104, 'Sneha', 'Finance', 80000),
(105, 'Vikram', 'Sales', 90000),
(106, 'Anjali', 'HR', 70000),
(107, 'Kiran', 'Finance', 80000);

-- ============================================
-- 1. TOP 3 HIGHEST SALARIES
-- ============================================

SELECT *
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- ============================================
-- 2. SECOND HIGHEST SALARY
-- ============================================

SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);

-- ============================================
-- 3. FIND DUPLICATE RECORDS
-- Here we find duplicate salary values
-- ============================================

SELECT
    Salary,
    COUNT(*) AS Duplicate_Count
FROM Employees
GROUP BY Salary
HAVING COUNT(*) > 1;

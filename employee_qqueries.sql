-- ============================================
-- TASK 3: EMPLOYEE-DEPARTMENT JOIN REPORT
-- ============================================

CREATE TABLE IF NOT EXISTS Departments (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);

-- Insert department records
INSERT INTO Departments
(Department_ID, Department_Name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');

-- Add Department_ID to Employees
-- Run this only if Department_ID does not already exist
ALTER TABLE Employees
ADD COLUMN Department_ID INT;

-- Assign departments to employees
UPDATE Employees SET Department_ID = 1 WHERE Employee_ID IN (101, 103);
UPDATE Employees SET Department_ID = 2 WHERE Employee_ID IN (102, 106);
UPDATE Employees SET Department_ID = 3 WHERE Employee_ID IN (104, 107);
UPDATE Employees SET Department_ID = 4 WHERE Employee_ID = 105;

-- ============================================
-- INNER JOIN REPORT
-- ============================================

SELECT
    e.Employee_ID,
    e.Employee_Name,
    d.Department_Name,
    e.Salary
FROM Employees e
INNER JOIN Departments d
    ON e.Department_ID = d.Department_ID
ORDER BY d.Department_Name, e.Employee_Name;

-- ============================================
-- DEPARTMENT-WISE EMPLOYEE REPORT
-- ============================================

SELECT
    d.Department_Name,
    COUNT(e.Employee_ID) AS Employee_Count,
    AVG(e.Salary) AS Average_Salary
FROM Departments d
LEFT JOIN Employees e
    ON d.Department_ID = e.Department_ID
GROUP BY d.Department_ID, d.Department_Name
ORDER BY d.Department_Name;

-- ============================================
-- TASK 4: TRIGGER TO LOG DELETED EMPLOYEE RECORDS
-- ============================================

USE company_db;

-- Create table to store deleted employee details

CREATE TABLE IF NOT EXISTS Employee_Delete_Log (
    Log_ID INT PRIMARY KEY AUTO_INCREMENT,
    Employee_ID INT,
    Employee_Name VARCHAR(100),
    Department_ID INT,
    Salary DECIMAL(10,2),
    Deleted_At TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Remove old trigger if it already exists

DROP TRIGGER IF EXISTS after_employee_delete;

-- Create DELETE trigger

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employees
FOR EACH ROW
BEGIN

    INSERT INTO Employee_Delete_Log
    (
        Employee_ID,
        Employee_Name,
        Department_ID,
        Salary
    )
    VALUES
    (
        OLD.Employee_ID,
        OLD.Employee_Name,
        OLD.Department_ID,
        OLD.Salary
    );

END //

DELIMITER ;

-- ============================================
-- TEST THE TRIGGER
-- ============================================

-- Delete one employee
DELETE FROM Employees
WHERE Employee_ID = 107;

-- Check deleted employee log
SELECT * FROM Employee_Delete_Log;

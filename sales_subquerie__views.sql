-- ============================================
-- TASK 6: VIEWS FOR MONTHLY PERFORMANCE REPORT
-- ============================================

USE sales_db;

-- Remove the view if it already exists
DROP VIEW IF EXISTS Monthly_Performance;

-- Create Monthly Performance View

CREATE VIEW Monthly_Performance AS
SELECT
    DATE_FORMAT(s.Sale_Date, '%Y-%m') AS Sale_Month,
    COUNT(s.Sale_ID) AS Number_Of_Sales,
    SUM(s.Quantity) AS Total_Quantity_Sold,
    SUM(s.Quantity * p.Price) AS Total_Sales_Amount
FROM Sales s
INNER JOIN Products p
    ON s.Product_ID = p.Product_ID
GROUP BY DATE_FORMAT(s.Sale_Date, '%Y-%m')
ORDER BY Sale_Month;

-- Display the monthly performance report

SELECT *
FROM Monthly_Performance;

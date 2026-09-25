-- ============================================
-- TASK 5: PRODUCT SALES ANALYSIS USING SUBQUERIES
-- ============================================

CREATE DATABASE IF NOT EXISTS sales_db;
USE sales_db;

-- ============================================
-- PRODUCTS TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- ============================================
-- SALES TABLE
-- ============================================

CREATE TABLE IF NOT EXISTS Sales (
    Sale_ID INT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Sale_Date DATE NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- ============================================
-- INSERT PRODUCT DATA
-- ============================================

INSERT INTO Products
(Product_ID, Product_Name, Category, Price)
VALUES
(1, 'Laptop', 'Electronics', 60000),
(2, 'Phone', 'Electronics', 30000),
(3, 'Headphones', 'Accessories', 3000),
(4, 'Keyboard', 'Accessories', 2000),
(5, 'Monitor', 'Electronics', 15000);

-- ============================================
-- INSERT SALES DATA
-- ============================================

INSERT INTO Sales
(Sale_ID, Product_ID, Quantity, Sale_Date)
VALUES
(101, 1, 2, '2026-08-05'),
(102, 2, 5, '2026-08-10'),
(103, 3, 10, '2026-08-15'),
(104, 4, 8, '2026-09-02'),
(105, 5, 4, '2026-09-10'),
(106, 2, 3, '2026-09-15'),
(107, 1, 1, '2026-09-20');

-- ============================================
-- SUBQUERY 1:
-- Products with price above average price
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

-- ============================================
-- SUBQUERY 2:
-- Products that have at least one sale
-- ============================================

SELECT
    Product_ID,
    Product_Name,
    Price
FROM Products p
WHERE EXISTS (
    SELECT 1
    FROM Sales s
    WHERE s.Product_ID = p.Product_ID
);

-- ============================================
-- SUBQUERY 3:
-- Products whose total quantity sold
-- is greater than the average quantity
-- ============================================

SELECT
    Product_ID,
    SUM(Quantity) AS Total_Quantity_Sold
FROM Sales
GROUP BY Product_ID
HAVING SUM(Quantity) > (
    SELECT AVG(Total_Quantity)
    FROM (
        SELECT
            SUM(Quantity) AS Total_Quantity
        FROM Sales
        GROUP BY Product_ID
    ) AS ProductTotals
);

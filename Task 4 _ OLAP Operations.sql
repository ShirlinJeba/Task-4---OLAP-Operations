Create database sales;
use sales;

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(100),
    Date DATE,
    Sales_Amount DECIMAL(10, 2)
);


-- Drill Down---

SELECT Region, Product_Id, SUM(Sales_Amount) AS Total_Sales
FROM sales_sample
GROUP BY Region, Product_Id
ORDER BY Region,
Total_Sales DESC;

--- ROLLUP---

SELECT 
    Region,
    Product_Id,
    SUM(Sales_Amount) AS Total_Sales
FROM 
    sales_sample
GROUP BY 
    Region, Product_Id WITH ROLLUP;

--- Slice--

SELECT Product_Id,Region,Date,Sales_Amount
FROM sales_sample
WHERE Region = 'East';

--- Dice--

SELECT Product_Id,Region,Date,Sales_Amount
FROM sales_sample
WHERE Product_Id IN (101, 105, 110)
AND Region IN ('East', 'West')
AND Date BETWEEN '2025-08-01' AND '2025-08-05';
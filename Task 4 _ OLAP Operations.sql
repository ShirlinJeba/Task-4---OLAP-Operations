Create database sales;
use sales;

CREATE TABLE sales_sample (
    Product_Id INT,
    Region VARCHAR(100),
    Date DATE,
    Sales_Amount DECIMAL(10, 2)
);
--- insert data---
INSERT INTO sales_sample (Product_Id, Region, Date, Sales_Amount) VALUES
(101, 'East', '2025-08-01', 15500.5),
(102, 'West', '2025-08-01', 25200),
(103, 'North', '2025-08-02', 14800.75),
(104, 'South', '2025-08-03', 23000),
(105, 'East', '2025-08-04', 17200.25),
(106, 'West', '2025-08-05', 25100),
(107, 'North', '2025-08-06', 19700.9),
(108, 'South', '2025-08-07', 21300),
(109, 'East', '2025-08-08', 19600.3),
(110, 'West', '2025-08-09', 22300);

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
use sales;

select * from sales_sample;

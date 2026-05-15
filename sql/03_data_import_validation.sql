-- To use the correct dataset we select at the top right corner of ssms or write the below query:
USE retail_analysis;

-- The below queries will confirm if row counts are loaded properly

-- ======================
-- Data Import Validation
-- ======================

-- Stores rows counting( This should output 45 stores)
SELECT COUNT(*) AS Total_stores
FROM Stores;

-- Features row counting(This should output 8190 rows for indicators)
SELECT COUNT(*) AS Total_features
FROM Features;

-- Sales row counting(This should output 421570 rows of sales events)
SELECT COUNT(*) AS Total_sales
FROM sales;

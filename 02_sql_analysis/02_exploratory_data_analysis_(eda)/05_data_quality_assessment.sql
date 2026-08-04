-- ============================================================================================
-- Data Quality Assessment
-- Purpose:
-- To assess the quality of the datasets before performingdata cleaning and business analysis.
-- ============================================================================================

-- =======================================================
-- The following assesment will be performed:
-- 1) Missing Values
-- 2) Invalid Store IDs
-- 3) Negative Weekly Sales
-- 4) Store Size Validation
-- 5) Temperature Range Validation
-- 6) Fuel Price Validation
-- 7) CPI Validation
-- 8) Unemployment Validation
-- 9) Holiday  Validation
-- 10) Referential Integrity
-- ========================================================

-- ===============================================================================================
-- 1) 
-- Missing Values
-- Purpose:
-- To verify that the Sales, Features, and Stores tables do not contain missing values:
-- This section was completed on the 02_exploratory_data_analysis section as "03_missing values". 
-- ===============================================================================================


-- =====================================================================================================
-- 2)
-- Invalid store IDs
-- Purpose:
-- To verify that every store appearing in the sales and features tables also exist in the stores table.
-- Notes:
-- s = sales table alias
-- f = features table alias
-- st = stores table alias
-- =====================================================================================================
-- Sales vs Stores.
SELECT DISTINCT s.store
FROM [retail_analysis].[dbo].[sales] AS s
LEFT JOIN [retail_analysis].[dbo].[stores] AS st
ON s.store = st.store
WHERE st.store IS NULL;
-- Result: No invalid store IDs found.


-- Features vs Stores.
SELECT DISTINCT f.store
FROM [retail_analysis].[dbo].[features] AS f
LEFT JOIN [retail_analysis].[dbo].[stores] AS st
ON f.store = st.store
WHERE st.store IS NULL;
-- Result: No invalid store IDs found.


-- =====================================================================================================
-- 3)
-- Negative Weekly Sales
-- Purpose:
-- To identify records with negative weekly sales values that may represent customer returns, refunds, 
-- data entry errors, or other business events.
-- =====================================================================================================

-- Displays records with negative weekly sales values.
SELECT store,
       dept,
       date,
       weekly_sales
FROM [retail_analysis].[dbo].[sales]
WHERE TRY_CAST(weekly_sales AS DECIMAL(20,2)) < 0;


-- Count the total number of negative weekly sales records.
SELECT COUNT(*) AS negative_weekly_sales_records
FROM [retail_analysis].[dbo].[sales]
WHERE TRY_CAST(Weekly_Sales AS DECIMAL(20,2)) < 0;



        
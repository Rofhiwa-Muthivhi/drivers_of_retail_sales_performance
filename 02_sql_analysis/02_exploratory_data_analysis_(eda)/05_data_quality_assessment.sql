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
-- Table relationship Validation
-- Purpose:
-- To verify that the relationships between the Sales, Features, and Stores tables are complete and valid.
-- Notes:
-- s = sales table alias
-- f = features table alias
-- st = stores table alias
-- =====================================================================================================

-- Check that all store IDs in the Sales table exist in the Stores table.
SELECT DISTINCT s.store
FROM [retail_analysis].[dbo].[sales] AS s
LEFT JOIN [retail_analysis].[dbo].[stores] AS st
ON s.store = st.store
WHERE st.store IS NULL;
-- Result: No invalid store IDs found.


-- Check that all store IDs in the Features table exist in the Stores table.
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
-- Weekly_Sales column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT store,
       dept,
       date,
       weekly_sales
FROM [retail_analysis].[dbo].[sales]
WHERE TRY_CAST(weekly_sales AS DECIMAL(20,2)) < 0;


-- Count the total number of negative weekly sales records.
-- Weekly_Sales column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT COUNT(*) AS negative_weekly_sales_records
FROM [retail_analysis].[dbo].[sales]
WHERE TRY_CAST(Weekly_Sales AS DECIMAL(20,2)) < 0;


-- =====================================================================================================
-- 4)
-- Store Size Validation
-- Purpose:
-- To verify that all store size values are valid and greater than zero, ensuring each store has
-- a meaningful physical size. 
-- =====================================================================================================

-- Display stores with invalid size values.
-- Size column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT store,
       [type],
       [size]
FROM [retail_analysis].[dbo].[stores]
WHERE TRY_CAST(Size AS INT) <= 0 OR TRY_CAST(Size AS INT) IS NULL;
-- Result:
-- No invalid store size values found.


-- =====================================================================================================
-- 5)
-- Temperature Range Validation
-- Purpose:
-- To identify unrealistic temperatures values, ensuring that weather data used for analysis is 
-- valid and reliable.
-- =====================================================================================================

-- Review the minimum and maximum recorded temperatures.
-- Temperature column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT MIN(TRY_CAST(temperature AS DECIMAL(10,2))) AS minimum_temperature,
       MAX(TRY_CAST(temperature AS DECIMAL(10,2))) AS maximum_temperature
FROM [retail_analysis].[dbo].[features];


-- Display records with invalid temperature values.
-- Temperature column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT store,
       [Date],
       Temperature
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(Temperature AS DECIMAL(10,2)) < -50
      OR TRY_CAST(Temperature AS DECIMAL(10,2)) > 150
      OR TRY_CAST(Temperature AS DECIMAL(10,2)) IS NULL;


-- =====================================================================================================
-- 6)
-- Fuel Price Validation
-- Purpose:
-- To identify unrealistic fuel values, ensuring that fuel price data used for analysis is 
-- valid and reliable.
-- =====================================================================================================

-- Review the minimum and maximum recorded fuel prices.
-- Fuel_Price column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT MIN(TRY_CAST(fuel_price AS DECIMAL(10,2))) AS minimum_fuel_price,
       MAX(TRY_CAST(fuel_price AS DECIMAL(10,2))) AS maximum_fuel_price
FROM [retail_analysis].[dbo].[features];


-- Display records with invalid fuel price values.
-- Fuel_Price column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT store,
       [date],
       fuel_price
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(fuel_price AS DECIMAL(10,2)) <= 0
      OR TRY_CAST(fuel_price AS DECIMAL(10,2)) IS NULL;


-- =====================================================================================================
-- 7)
-- Consumer Price Index(CPI) Validation
-- Purpose:
-- To identify unrealistic cpi values, ensuring that cpi data used for analysis is 
-- valid and reliable.
-- =====================================================================================================

-- Review the minimum and maximum recorded CPI values.
-- CPI column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT MIN(TRY_CAST(cpi AS DECIMAL(10,2))) AS minimum_cpi,
       MAX(TRY_CAST(cpi AS DECIMAL(10,2))) AS maximum_cpi
FROM [retail_analysis].[dbo].[features];


-- Display records with invalid CPI values.
-- CPI column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT store,
       [date],
       cpi
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(cpi AS DECIMAL(10,2)) <= 0
      OR TRY_CAST(cpi AS DECIMAL(10,2)) IS NULL;


-- =====================================================================================================
-- 8)
-- Unemployment Validation
-- Purpose:
-- To identify unrealistic unemployment values, ensuring that unemployment data used for analysis is 
-- valid and reliable.
-- =====================================================================================================

-- Review the minimum and maximum unemployment values.
-- Unemployment column is imported as NVARCHAR. TRY_CAST() is used to safely convert values to numeric data type.
SELECT MIN(TRY_CAST(unemployment AS FLOAT)) AS minimum_unemployment,
       MAX(TRY_CAST(unemployment AS FLOAT)) AS maximum_unemployment
FROM [retail_analysis].[dbo].[features];


-- Check for unrealistic unemployment values, valid unemployment rates fall between 0% and 100%.
SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(unemployment AS FLOAT) < 0
      OR TRY_CAST(unemployment AS FLOAT) > 100;


-- =====================================================================================================
-- 9)
-- Holiday Flag Validation
-- Purpose:
-- To verify that the IsHoliday column contains only valid binary values,ensuring holiday 
-- records are correctly represented for analysis.
-- =====================================================================================================

-- Review the distinct values stored in the isholiday column in both sales and features tables.

-- Check the distinct holiday flag values in the Sales table..
SELECT DISTINCT IsHoliday
FROM [retail_analysis].[dbo].[sales];

-- Check the distinct holiday flag values in the Features table.
SELECT DISTINCT IsHoliday
FROM [retail_analysis].[dbo].[features];


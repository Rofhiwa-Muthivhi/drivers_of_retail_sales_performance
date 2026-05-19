-- WEEKLY SALES DATA TYPE CLEANING.

-- ====================================================
-- Checking datatypes for all columns in sales table.
-- Discovered weekly_sales was imported as varchar.
-- ====================================================
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales';


-- Check if weekly_sales can cast to float without nulls and errors.
SELECT TOP 10
       weekly_sales,
       TRY_CAST(weekly_sales AS FLOAT) AS weekly_sales_numeric
FROM sales;

-- =========================================================
-- Convert weekly_sales from varchar to float.
-- This will enable aggregations and sales trend analysis.
-- =========================================================
ALTER TABLE sales
ALTER COLUMN weekly_sales FLOAT;


-- Verifying if the alter query executed successfully.
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales' AND column_name = 'weekly_sales';
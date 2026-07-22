-- DATE DATA TYPE CLEANING FOR SALES & FEATURES TABLE

-- =====================================================================
-- Converting date columns from varchar to date datatype.
-- This will enable proper time series analysis
-- Adopted the 103 SQL server format for date interpretation dd/mm/yyyy
-- =====================================================================

-- Validating the converstion format to sales and features
SELECT TOP 10
       date AS original_date,
       TRY_CONVERT(DATE, date, 103) AS converted_date
FROM [dbo].[Sales];

SELECT TOP 10
       date AS original_date,
       TRY_CONVERT(DATE, date, 103) AS converted_date
FROM [dbo].[Features];


-- Converting the values for both sales and features
UPDATE sales
SET date = TRY_CONVERT(DATE, date, 103);

UPDATE features
SET date = TRY_CONVERT(DATE, date, 103);

-- Permanently changing the data type
ALTER TABLE sales
ALTER COLUMN date DATE;

ALTER TABLE features
ALTER COLUMN date DATE;

-- Verifying if the above queries where successful in execution
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sales';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'features';
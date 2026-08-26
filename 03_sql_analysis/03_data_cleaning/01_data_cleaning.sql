-- ============================================================
-- DATA CLEANING
-- This script documents the data cleaning process
-- for all three tables in the retail_analysis database.
-- ============================================================


-- ============================================================
-- STORES DATASET
-- Columns: store, type, size
-- ============================================================

USE retail_analysis;


-- ============================================================
-- 1. Review the raw data
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[stores];


-- ============================================================
-- 2. Check for duplicate store IDs
-- Expected result: 0 rows
-- ============================================================

SELECT store,
       COUNT(*) AS record_count
FROM [retail_analysis].[dbo].[stores]
GROUP BY store
HAVING COUNT(*) > 1;


-- ============================================================
-- 3. Check for missing values
-- Expected result: 0 missing values in all columns
-- ============================================================

SELECT
      SUM(CASE WHEN store IS NULL THEN 1 ELSE 0 END) AS missing_store,
      SUM(CASE WHEN type IS NULL THEN 1 ELSE 0 END) AS missing_type,
      SUM(CASE WHEN size IS NULL THEN 1 ELSE 0 END) AS missing_size
FROM [retail_analysis].[dbo].[stores];


-- ============================================================
-- 4. Check current data types
-- Result: columns are initially NVARCHAR
-- ============================================================

SELECT COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'stores'AND TABLE_SCHEMA = 'dbo';


-- ============================================================
-- 5. Check whether store and size can be converted to INT
-- Quotation marks were identified in the imported values.
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[stores]
WHERE TRY_CAST(store AS INT) IS NULL
      OR TRY_CAST(size AS INT) IS NULL;


-- ============================================================
-- 6.Removal of quotation marks
-- ============================================================

SELECT store,
       REPLACE(store, '"', '') AS cleaned_store,
       [size],
       REPLACE([size], '"', '') AS cleaned_size
FROM [retail_analysis].[dbo].[stores];


-- ============================================================
-- 7. Validate conversion after removing quotation marks
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[stores]
WHERE TRY_CAST(REPLACE(store, '"', '') AS INT) IS NULL
      OR TRY_CAST(REPLACE(size, '"', '') AS INT) IS NULL;


-- ============================================================
-- 8. Remove quotation marks from store and size
-- ============================================================

UPDATE [dbo].[stores]
SET
store = REPLACE(store, '"', ''),
[size] = REPLACE([size], '"', '');


-- ============================================================
-- 9. Verify cleaned data
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[stores];


-- ============================================================
-- 10. Standardize data types
-- store -> INT
-- type  -> VARCHAR(1)
-- size  -> INT
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[stores]
ALTER COLUMN store INT;

ALTER TABLE [retail_analysis].[dbo].[stores]
ALTER COLUMN type VARCHAR(1);

ALTER TABLE [retail_analysis].[dbo].[stores]
ALTER COLUMN [size] INT;


-- ============================================================
-- 11. Validate final data types
-- Expected result:
-- store = int
-- type  = varchar
-- size  = int
-- ============================================================

SELECT COLUMN_NAME,DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'stores' AND TABLE_SCHEMA = 'dbo';



-- ============================================================
-- FEATURES DATASET
-- Columns: store, date, temperature, fuel_price,
--          markdown1, markdown2, markdown3, markdown4,
--          markdown5, CPI, unemployment, isholiday
-- ============================================================


-- ============================================================
-- 1. Review the raw data
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 2. Check for duplicate store/date combinations
-- Expected result: 0 rows
-- ============================================================

SELECT store,
       [date],
       COUNT(*) AS record_count
FROM [retail_analysis].[dbo].[features]
GROUP BY store, [date]
HAVING COUNT(*) > 1;


-- ============================================================
-- 3. Check for missing values
-- NULL and 'NA' values are checked separately because
-- the columns were imported as NVARCHAR.
-- ============================================================

SELECT
      SUM(CASE WHEN store IS NULL OR store = '' THEN 1 ELSE 0 END) AS missing_store,
      SUM(CASE WHEN [date] IS NULL OR date = '' THEN 1 ELSE 0 END) AS missing_date,
      SUM(CASE WHEN temperature IS NULL OR temperature = '' THEN 1 ELSE 0 END) AS missing_temperature,
      SUM(CASE WHEN fuel_price IS NULL OR fuel_price = '' THEN 1 ELSE 0 END) AS missing_fuel_price,
      SUM(CASE WHEN markdown1 IS NULL OR markdown1 = 'NA' THEN 1 ELSE 0 END) AS missing_markdown1,
      SUM(CASE WHEN markdown2 IS NULL OR markdown2 = 'NA' THEN 1 ELSE 0 END) AS missing_markdown2,
      SUM(CASE WHEN markdown3 IS NULL OR markdown3 = 'NA' THEN 1 ELSE 0 END) AS missing_markdown3,
      SUM(CASE WHEN markdown4 IS NULL OR markdown4 = 'NA' THEN 1 ELSE 0 END) AS missing_markdown4,
      SUM(CASE WHEN markdown5 IS NULL OR markdown5 = 'NA' THEN 1 ELSE 0 END) AS missing_markdown5,
      SUM(CASE WHEN CPI IS NULL OR CPI = '' THEN 1 ELSE 0 END) AS missing_CPI,
      SUM(CASE WHEN unemployment IS NULL OR unemployment = '' THEN 1 ELSE 0 END) AS missing_unemployment,
      SUM(CASE WHEN isholiday IS NULL OR isholiday = '' THEN 1 ELSE 0 END) AS missing_isholiday
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 4. Check current data types
-- Result: columns are initially NVARCHAR
-- ============================================================

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'features' AND TABLE_SCHEMA = 'dbo';


-- ============================================================
-- 5. Check for quotation marks in imported values
-- Quotation marks were identified in the imported values.
-- ============================================================

SELECT TOP 10
       store,
       isholiday
FROM [retail_analysis].[dbo].[features]
WHERE store LIKE '%"%' OR isholiday LIKE '%"%';


-- ============================================================
-- 6. Removal of quotation marks
-- ============================================================

SELECT store,
       REPLACE(store, '"', '') AS cleaned_store,
       isholiday,
       REPLACE(isholiday, '"', '') AS cleaned_isholiday
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 7. Validate conversion after removing quotation marks
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(REPLACE(store, '"', '') AS INT) IS NULL;


-- ============================================================
-- 8. Remove quotation marks from store and isholiday
-- ============================================================

UPDATE [dbo].[features]
SET
store = REPLACE(store, '"', ''),
isholiday = REPLACE(isholiday, '"', '');


-- ============================================================
-- 9. Verify cleaned data
-- ============================================================

SELECT TOP 10 *
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 10. Handle NA values in Markdown columns
-- Preview the replacement of NA with 0
-- ============================================================

SELECT Markdown1,
       REPLACE(Markdown1, 'NA', '0') AS Cleaned_Markdown1,
       Markdown2,
       REPLACE(Markdown2, 'NA', '0') AS Cleaned_Markdown2,
       Markdown3,
       REPLACE(Markdown3, 'NA', '0') AS Cleaned_Markdown3,
       Markdown4,
       REPLACE(Markdown4, 'NA', '0') AS Cleaned_Markdown4,
       Markdown5,
       REPLACE(Markdown5, 'NA', '0') AS Cleaned_Markdown5
FROM [retail_analysis].[dbo].[features]
WHERE Markdown1 = 'NA' OR Markdown2 = 'NA'OR Markdown3 = 'NA' OR Markdown4 = 'NA'OR Markdown5 = 'NA';


-- ============================================================
-- 11. Replace NA values with 0
-- ============================================================

UPDATE [dbo].[features]
SET
Markdown1 = REPLACE(Markdown1, 'NA', '0'),
Markdown2 = REPLACE(Markdown2, 'NA', '0'),
Markdown3 = REPLACE(Markdown3, 'NA', '0'),
Markdown4 = REPLACE(Markdown4, 'NA', '0'),
Markdown5 = REPLACE(Markdown5, 'NA', '0');


-- ============================================================
-- 12. Validate Markdown columns after replacing NA
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE Markdown1 = 'NA'
      OR Markdown2 = 'NA'
      OR Markdown3 = 'NA'
      OR Markdown4 = 'NA'
      OR Markdown5 = 'NA';


-- ============================================================
-- 13. Validate data type conversions
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(store AS INT) IS NULL
   OR TRY_CONVERT([Date], date, 103) IS NULL
   OR TRY_CAST(temperature AS FLOAT) IS NULL
   OR TRY_CAST(fuel_price AS DECIMAL(10,3)) IS NULL
   OR TRY_CAST(markdown1 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(markdown2 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(markdown3 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(markdown4 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(markdown5 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(CPI AS DECIMAL(10,3)) IS NULL
   OR TRY_CAST(unemployment AS DECIMAL(10,3)) IS NULL;



-- ============================================================
-- 14. Check for NA values in CPI and Unemployment
-- ============================================================

SELECT
    SUM(CASE WHEN CPI = 'NA' THEN 1 ELSE 0 END) AS missing_CPI,
    SUM(CASE WHEN Unemployment = 'NA' THEN 1 ELSE 0 END) AS missing_Unemployment
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 15. Investigate missing CPI and Unemployment records
-- ============================================================

SELECT
    SUM(CASE 
            WHEN CPI = 'NA' AND Unemployment = 'NA' THEN 1 ELSE 0 
        END) AS both_missing,

    SUM(CASE 
            WHEN CPI = 'NA' AND Unemployment <> 'NA' THEN 1 ELSE 0 
        END) AS CPI_only_missing,

    SUM(CASE 
            WHEN CPI <> 'NA' AND Unemployment = 'NA' THEN 1 ELSE 0 
        END) AS unemployment_only_missing
FROM [retail_analysis].[dbo].[features];


-- Inspect records with missing CPI and Unemployment
SELECT Store,
       [Date],
       CPI,
       Unemployment
FROM [retail_analysis].[dbo].[features]
WHERE CPI = 'NA' AND Unemployment = 'NA'
ORDER BY Store, [Date];


-- ============================================================
-- 16. Check the date range of missing CPI and Unemployment
-- ============================================================

SELECT MIN(TRY_CONVERT([Date], Date, 103)) AS first_missing_date,
       MAX(TRY_CONVERT([Date], Date, 103)) AS last_missing_date,
       COUNT(DISTINCT Store) AS affected_stores,
       COUNT(DISTINCT [Date]) AS affected_dates,
       COUNT(*) AS affected_records
FROM [retail_analysis].[dbo].[features]
WHERE CPI = 'NA' AND Unemployment = 'NA';


-- ============================================================
-- 17. Preview replacement of NA with NULL
-- ============================================================

SELECT CPI,
       NULLIF(CPI, 'NA') AS Cleaned_CPI,
       Unemployment,
       NULLIF(Unemployment, 'NA') AS Cleaned_Unemployment
FROM [retail_analysis].[dbo].[features]
WHERE CPI = 'NA' OR Unemployment = 'NA';


-- ============================================================
-- 18. Allow NULL values in CPI and Unemployment
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN CPI NVARCHAR(50) NULL;

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN Unemployment NVARCHAR(50) NULL;


-- ============================================================
-- 19. Replace NA values with NULL
-- ============================================================

UPDATE [dbo].[features]
SET
CPI = NULLIF(CPI, 'NA'),
Unemployment = NULLIF(Unemployment, 'NA')
WHERE CPI = 'NA' OR Unemployment = 'NA';


-- ============================================================
-- 20. Verify CPI and Unemployment after replacing NA
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE CPI = 'NA' OR Unemployment = 'NA';

-- Confirm that exactly 585 NULL values exist
SELECT SUM(CASE WHEN CPI IS NULL THEN 1 ELSE 0 END) AS missing_CPI,
       SUM(CASE WHEN Unemployment IS NULL THEN 1 ELSE 0 END) AS missing_Unemployment
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 21. Revalidate data type conversions
-- Expected result: 0 rows
-- ============================================================

SELECT *
FROM [retail_analysis].[dbo].[features]
WHERE TRY_CAST(store AS INT) IS NULL
   OR TRY_CONVERT(DATE, [Date], 103) IS NULL
   OR TRY_CAST(Temperature AS FLOAT) IS NULL
   OR TRY_CAST(Fuel_Price AS DECIMAL(10,3)) IS NULL
   OR TRY_CAST(MarkDown1 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(MarkDown2 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(MarkDown3 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(MarkDown4 AS DECIMAL(18,2)) IS NULL
   OR TRY_CAST(MarkDown5 AS DECIMAL(18,2)) IS NULL
   OR (CPI IS NOT NULL 
       AND TRY_CAST(CPI AS DECIMAL(10,3)) IS NULL)
   OR (Unemployment IS NOT NULL 
       AND TRY_CAST(Unemployment AS DECIMAL(10,3)) IS NULL);


-- ============================================================
-- 22. Standardize Date values before datatype conversion
-- Source format: DD/MM/YYYY
-- Target text format: YYYY-MM-DD
-- ============================================================

UPDATE [retail_analysis].[dbo].[features]
SET [Date] = CONVERT(VARCHAR(10), TRY_CONVERT(DATE, [Date], 103), 23);

-- Standardize Store and Date data types
-- Store -> INT
-- Date  -> DATE
ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN Store INT;

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN [Date] DATE;

-- Verify standardized Date values
SELECT TOP 10 [Date]
FROM [retail_analysis].[dbo].[features];


-- ============================================================
-- 23. Verify Store and Date data types
-- ============================================================

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'features' AND TABLE_SCHEMA = 'dbo'
      AND COLUMN_NAME IN ('Store', 'Date');


-- ============================================================
-- 24. Standardize Temperature data type
-- Temperature -> FLOAT
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN Temperature FLOAT;


-- ============================================================
-- 25. Standardize Fuel_Price data type
-- Fuel_Price -> DECIMAL(10,3)
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN Fuel_Price DECIMAL(10,3);


-- ============================================================
-- 26. Standardize Markdown data types
-- MarkDown1-5 -> DECIMAL(18,2)
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN MarkDown1 DECIMAL(18,2);

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN MarkDown2 DECIMAL(18,2);

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN MarkDown3 DECIMAL(18,2);

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN MarkDown4 DECIMAL(18,2);

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN MarkDown5 DECIMAL(18,2);


-- ============================================================
-- 27. Standardize CPI and Unemployment data types
-- CPI           -> DECIMAL(10,3)
-- Unemployment  -> DECIMAL(10,3)
-- NULL values are preserved
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN CPI DECIMAL(10,3);

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN Unemployment DECIMAL(10,3);


-- ============================================================
-- 28. Validate IsHoliday values
-- Expected result: TRUE and FALSE only
-- ============================================================

SELECT IsHoliday,
       COUNT(*) AS record_count
FROM [retail_analysis].[dbo].[features]
GROUP BY IsHoliday
ORDER BY IsHoliday;


-- ============================================================
-- 29. Convert IsHoliday values to 1 and 0
-- TRUE  -> 1
-- FALSE -> 0
-- ============================================================

UPDATE [retail_analysis].[dbo].[features]
SET IsHoliday =
    CASE
        WHEN IsHoliday = 'TRUE' THEN '1'
        WHEN IsHoliday = 'FALSE' THEN '0'
    END;


-- ============================================================
-- 30. Verify IsHoliday values after conversion
-- Expected result: only 0 and 1
-- ============================================================

SELECT IsHoliday,
       COUNT(*) AS record_count
FROM [retail_analysis].[dbo].[features]
GROUP BY IsHoliday
ORDER BY IsHoliday;


-- ============================================================
-- 31. Standardize IsHoliday data type
-- IsHoliday -> BIT
-- 0 = FALSE
-- 1 = TRUE
-- ============================================================

ALTER TABLE [retail_analysis].[dbo].[features]
ALTER COLUMN IsHoliday BIT;


-- ============================================================
-- 32. Final Features data type validation
-- ============================================================

SELECT COLUMN_NAME,
       DATA_TYPE,
       CHARACTER_MAXIMUM_LENGTH,
       NUMERIC_PRECISION,
       NUMERIC_SCALE,
       IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'features' AND TABLE_SCHEMA = 'dbo'
ORDER BY ORDINAL_POSITION;


-- ============================================================
-- 33. Final Features row count validation
-- Expected result: 8,190 rows
-- ============================================================

SELECT COUNT(*) AS total_features_rows
FROM [retail_analysis].[dbo].[features];
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

UPDATE dbo.stores
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